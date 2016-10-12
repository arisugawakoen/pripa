'use strict'

const moment = require('moment')
const models = require('../models')

if (process.argv[3]) {
  models.board.findOne({
    attributes: ['id'],
    where: {
      title: process.argv[2]
    }
  }).then((result) => {
    if (result) {
      models.board.sequelize.query(
        "insert into threads (title, board_id, date) value ($1, (select id from boards where title=$2 ), $3)",
        { bind: [process.argv[3], process.argv[2], moment().format()]}
      ).then(() => {
        models.sequelize.close()
      })
    } else {
      console.log('board title does not exist')
    }
  })
} else {
  console.log('thread title has not been input')
}

