'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')
const create_thread = require('../bin/create_thread')

router.get('/:board/all', (req, res, next) => {
  let jsonThreads

  models.thread.sequelize.query(
    "select threads.id, threads.title from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.date DESC;",
    { bind: [req.params.board], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

router.post('/:board', (req, res, next) => {
  if (create_thread.create_thread(req.params.board, req.params.title)) {
    return "ok"
  else {
    return "ng"
  }
}

module.exports = router
