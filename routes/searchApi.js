'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')

// search articles

router.post('/article', (req, res) => {
  let jsonArticles
  const query = req.body.query ? '%' + req.body.query + '%' : null

  models.thread.sequelize.query(
    'select a.id as article_id, a.name, a.post, a.create_date, t.id as thread_id, t.title as thread_title, b.title as board_name from articles a join threads t on a.thread_id = t.id join boards b on t.board_id = b.id where a.post like $1 order by a.id DESC;',
    { bind: [query], type: models.sequelize.QueryTypes.SELECT }
  ).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

// search threads

router.post('/thread', (req, res) => {
  let jsonThreads
  const query = req.body.query ? '%' + req.body.query + '%' : null

  models.thread.sequelize.query(
    'select t.id as thread_id, t.title as thread_title, t.create_date, t.name, b.title as board_name from threads t join boards b on t.board_id = b.id where t.title like $1 order by t.id DESC;',
    { bind: [query], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

// search thread top articles

router.post('/thread_top', (req, res) => {
  let jsonArticles
  const query = req.body.query ? '%' + req.body.query + '%' : null

  models.thread.sequelize.query(
    'select t.name, t.post, t.create_date, t.id as thread_id, t.title as thread_title, b.title as board_name from threads t join boards b on t.board_id = b.id where t.post like $1 order by t.id DESC;',
    { bind: [query], type: models.sequelize.QueryTypes.SELECT }
  ).then((articles) => {
    jsonArticles = JSON.stringify(articles)
  }).then(() => {
    res.json(jsonArticles)
  })
})

module.exports = router
