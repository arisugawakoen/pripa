'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')
const moment = require('moment')

function escapeJsHTML(str) {
    return str
            .replace(/\\/g, '\\\\')
            .replace(/'/g, "\\'")
            .replace(/"/g, '\\"')
            .replace(/</g, '\\x3c')
            .replace(/>/g, '\\x3e')
            .replace(/(0x0D)/g, '\r')
            .replace(/(0x0A)/g, '\n')
            .replace(/&/g, '&amp;');
}

router.get('/:thread_id(\\d+)', (req, res, next) => {
  let jsonArticles
  let thread_id = parseInt(req.params.thread_id)

  models.article.findAll({
    where: {
      thread_id: thread_id
    },
    attributes: ['id', 'post', 'thread_id', 'create_date', 'name']
  }).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

router.get('/:thread_id(\\d+)/:offset(\\d+)/:limit(\\d+)', (req, res, next) => {
  let jsonArticles
  let thread_id = parseInt(req.params.thread_id)
  let offset = parseInt(req.params.offset)
  let limit = parseInt(req.params.limit)

  models.article.findAll({
    where: {
      thread_id: thread_id
    },
    offset: offset,
    limit: limit,
    order: 'id ASC',
    attributes: ['id', 'post', 'thread_id', 'create_date', 'name']
  }).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

router.get('/:thread_id(\\d+)/:limit(\\d+)', (req, res, next) => {
  let jsonArticles
  let thread_id = parseInt(req.params.thread_id)
  let limit = parseInt(req.params.limit)

  models.article.sequelize.query(
    "select * from (select id, post, thread_id, create_date, name from articles where thread_id=$1 order by id DESC limit $2) as n order by id ASC;",
    { bind: [thread_id, limit], type: models.sequelize.QueryTypes.SELECT }
  ).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

router.post('/:thread_id(\\d+)', (req, res, next) => {
  let thread_id = parseInt(req.body.thread_id)
  let post = req.body.post ? escapeJsHTML(req.body.post) : req.body.post
  let name = req.body.name ? escapeJsHTML(req.body.name) : req.body.name

  models.article.create({
    post: post,
    name: name,
    create_date: moment().add(9, 'h'),
    thread_id : req.body.thread_id
  }).then(() => {
  }).catch((e) => {
    console.log(e)
  })

  models.thread.update({
    update_date: moment().add(9, 'h')
  }, {
    where: {
      id: thread_id
    }
  }).then(() => {
    res.json({ message: 'ok' });
  }).catch((e) => {
    res.json({ message: 'ng' });
    console.log(e)
  })
})
    
module.exports = router
