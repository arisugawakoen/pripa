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

// get all threads name

router.get('/:board/all', (req, res) => {
  let jsonThreads

  models.thread.sequelize.query(
    'select threads.id, threads.title, threads.latest_res_number, threads.create_date, threads.update_date from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.update_date DESC;',
    { bind: [req.params.board], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

// get latest threads name and post

router.get('/:board/:offset(\\d+)/:limit(\\d+)', (req, res) => {
  let jsonThreads
  const offset = parseInt(req.params.offset)
  const limit = parseInt(req.params.limit)

  models.thread.sequelize.query(
    'select threads.id, threads.title, threads.create_date, threads.update_date, threads.name, threads.post from threads left join boards on threads.board_id = boards.id where boards.title = $1 order by threads.update_date DESC limit $3 offset $2;',
    { bind: [req.params.board, offset, limit], type: models.sequelize.QueryTypes.SELECT }
  ).then((threads) => {
    jsonThreads = JSON.stringify(threads)
  }).then(() => {
    res.json(jsonThreads)
  })
})

// get a thread name and post

router.get('/id/:threadId(\\d+)', (req, res) => {
  let jsonThread
  const threadId = parseInt(req.params.threadId)

  models.thread.sequelize.query(
    'select threads.id, threads.title, threads.create_date, threads.update_date, threads.name, threads.post, boards.title as board_name from threads left join boards on threads.board_id = boards.id where threads.id = $1',
    { bind: [threadId], type: models.sequelize.QueryTypes.SELECT }
  ).then((thread) => {
    jsonThread = JSON.stringify(thread[0])
  }).then(() => {
    res.json(jsonThread)
  })
})

// create a new thread

router.post('/:board', (req, res) => {
  const title = req.body.title ? escapeJsHTML(req.body.title) : ''
  const board = req.body.board ? escapeJsHTML(req.body.board) : ''
  const post = req.body.post ? escapeJsHTML(req.body.post) : ''
  const name = req.body.name ? escapeJsHTML(req.body.name) : ''


  if (req.body.title && req.body.post) {
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          'insert into threads (title, board_id, create_date, update_date, latest_res_number, post, name, createdAt, updatedAt) value ($1, (select id from boards where title=$2 ), $3, $3, 1, $4, $5, $3, $3)',
          { bind: [title, board, moment().format('YYYY-MM-DD HH:mm:ss'), post, name]}
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
