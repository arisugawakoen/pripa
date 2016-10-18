'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')
const moment = require('moment')

const re = /\d+/

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

router.get('/:board/:offset(\\d+)/:limit(\\d+)', (req, res, next) => {
  let jsonThreads
  let offset = parseInt(req.params.offset)
  let limit = parseInt(req.params.limit)

  models.thread.sequelize.query(
    "select threads.id, threads.title, threads.date, threads.name, threads.post from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.date DESC limit $3 offset $2;",
    { bind: [req.params.board, offset, limit], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

router.post('/:body', (req, res, next) => {
  let name
  let mail

  if (req.body.title && req.body.post) {
    name = req.body.name || null
    mail = req.body.mail || null
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: req.body.board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          "insert into threads (title, board_id, date, post, name, mail) value ($1, (select id from boards where title=$2 ), $3, $4, $5, $6)",
          { bind: [req.body.title, req.body.board, moment().format(), req.body.post, name, mail]}
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
