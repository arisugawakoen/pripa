'use strict'

const express = require('express')
const router = express.Router()
const models = require('../models')

// get all boards name

router.get('/all', (req, res) => {
  let jsonBoards

  models.board.findAll({
    order: 'create_date ASC',
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
