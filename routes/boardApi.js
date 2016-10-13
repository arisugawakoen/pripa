'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')

router.get('/all', (req, res, next) => {
  let jsonBoards

  models.board.findAll({
    order: 'date ASC',
    attributes: [
      'id', 'title'
    ] 
  }).then((boards) => {
    jsonBoards = JSON.stringify(boards)
  }).then(() => {
    res.json(jsonBoards)
  })
})

module.exports = router
