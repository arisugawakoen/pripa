'use strict'

const models = require('../models')

if (process.argv[2]) {
  models.board.create({
    title: process.argv[2],
    create_date: Date()
  }).then(() => {
    console.log('create board name: ', process.argv[2])
  }).then(() => {
    models.sequelize.close()
  })
} else {
  console.log('Argument has not been specified. Exit.')
}
