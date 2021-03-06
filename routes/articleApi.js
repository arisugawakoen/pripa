'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')
const moment = require('moment')

// escape JavaScript and HTML

function escapeJsHTML(str) {
  return str
    .replace(/\\/g, '\\\\')
    .replace(/&/g, '&amp;')
    .replace(/'/g, '&#39;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/(0x0D)/g, '\r')
    .replace(/(0x0A)/g, '\n')
}

// get all articles of a thread

router.get('/:thread_id(\\d+)', (req, res) => {
  let jsonArticles
  const thread_id = parseInt(req.params.thread_id)

  models.article.findAll({
    where: {
      thread_id: thread_id
    },
    attributes: ['id', 'post', 'thread_id', 'create_date', 'name', 'res_number']
  }).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

// get limited and offset (head)  articles of a thread

router.get('/:thread_id(\\d+)/:offset(\\d+)/:limit(\\d+)', (req, res) => {
  let jsonArticles
  const thread_id = parseInt(req.params.thread_id)
  const offset = parseInt(req.params.offset)
  const limit = parseInt(req.params.limit)

  models.article.findAll({
    where: {
      thread_id: thread_id
    },
    offset: offset,
    limit: limit,
    order: 'id ASC',
    attributes: ['id', 'post', 'thread_id', 'create_date', 'name', 'res_number']
  }).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

// get latest articles of a thread

router.get('/:thread_id(\\d+)/:limit(\\d+)', (req, res) => {
  let jsonArticles
  const thread_id = parseInt(req.params.thread_id)
  const limit = parseInt(req.params.limit)

  models.article.sequelize.query(
    'select * from (select id, post, thread_id, create_date, res_number, name from articles where thread_id=$1 order by id DESC limit $2) as n order by id ASC;',
    { bind: [thread_id, limit], type: models.sequelize.QueryTypes.SELECT }
  ).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

// post an article

router.post('/:thread_id(\\d+)', (req, res) => {
  let thread_id = parseInt(req.body.thread_id)
  const post = req.body.post ? escapeJsHTML(req.body.post) : ''
  const name = req.body.name ? escapeJsHTML(req.body.name) : ''

  models.article.sequelize.query(
    'insert into articles (post, name, create_date, thread_id, res_number, createdAt, updatedAt) value ($1, $2, $3, $4, (select latest_res_number from threads where id=$4), $3, $3)',
    { bind: [post, name, moment().format('YYYY-MM-DD HH:mm:ss'), thread_id] }
  ).then(() => {
    models.thread.sequelize.query(
      'UPDATE threads SET latest_res_number = latest_res_number + 1 where id = $1;',
      { bind: [ thread_id ] }
    )
  }).then(() => {
    res.json({ message: 'ok' })
  }).catch((e) => {
    res.json({ message: 'ng' })
    console.error(e)
  })

  models.thread.update({
    update_date: moment().add(9, 'h')
  }, {
    where: {
      id: thread_id
    }
  })
})
    
module.exports = router
