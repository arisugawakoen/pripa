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

router.get('/:board/all', (req, res, next) => {
  let jsonThreads

  models.thread.sequelize.query(
    "select threads.id, threads.title from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.update_date DESC;",
    { bind: [req.params.board], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

router.get('/:board/:offset(\\d+)/:limit(\\d+)', (req, res, next) => {
  let jsonThreads
  let offset = parseInt(req.params.offset)
  let limit = parseInt(req.params.limit)

  models.thread.sequelize.query(
    "select threads.id, threads.title, threads.create_date, threads.update_date, threads.name, threads.post from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.update_date DESC limit $3 offset $2;",
    { bind: [req.params.board, offset, limit], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

router.get('/id/:threadId(\\d+)', (req, res, next) => {
  let jsonThread
  let threadId = parseInt(req.params.threadId)

  models.thread.findById(threadId)
  .then((thread) => {
    jsonThread = JSON.stringify(thread)
  }).then(() => {
    res.json(jsonThread)
  })
})

router.post('/:board', (req, res, next) => {
  let title = req.body.title ? escapeJsHTML(req.body.title) : req.body.title
  let board = req.body.board ? escapeJsHTML(req.body.board) : req.body.board
  let post = req.body.post ? escapeJsHTML(req.body.post) : req.body.post
  let name = req.body.name ? escapeJsHTML(req.body.name) : req.body.name

  if (req.body.title && req.body.post) {
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          "insert into threads (title, board_id, create_date, update_date, post, name) value ($1, (select id from boards where title=$2 ), $3, $3, $4, $5)",
          { bind: [title, board, moment().format(), post, name]}
        ).then(() => {
          res.send('ok')
        })
      } else {
        res.send('ng')
      }
    })
  } else {
    res.send('ng')
  }
})

module.exports = router
