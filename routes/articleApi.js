'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')
const moment = require('moment')

router.get('/:thread_id(\\d+)', (req, res, next) => {
  let jsonArticles
  let thread_id = parseInt(req.params.thread_id)

  models.article.findall({
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

router.get('/:thread_id(\\d+)/:limit(\\d+)', (req, res, next) => {
  let jsonArticles
  let thread_id = parseInt(req.params.thread_id)
  let limit = parseInt(req.params.limit)

  models.article.sequelize.query(
    "select * from (select id, post, thread_id, create_date, name from articles where thread_id=$1 order by date DESC limit $2) as n order by id ASC;",
    { bind: [thread_id, limit]}
  ).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

router.post('/:thread_id(\\d+)', (req, res, next) => {
  let thread_id = parseInt(req.params.thread_id)
    
  models.article.create({
    post: req.body.post,
    name: req.body.name,
    create_date: Date(),
    thread_id : req.body.thread_id
  }).then(() => {
    res.send('ok')
  }).catch((e) => {
    res.send('ng')
    console.log(e)
  })

  models.thread.update({
    update_date: Date()
  }, {
    where: {
      thread_id: thread_id
    }
  }).then(() => {
    res.send('ok')
  }).catch((e) => {
    res.send('ng')
    console.log(e)
  })
})
    
module.exports = router
