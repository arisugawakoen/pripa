'use strict'

function create_thread(board, title) {
  const moment = require('moment')
  const models = require('../models')

  if (title) {
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          "insert into threads (title, board_id, date) value ($1, (select id from boards where title=$2 ), $3)",
          { bind: [title, board, moment().format()]}
        ).then(() => {
          return true
        })
      } else {
        return false
      }
    })
  } else {
    return false
  }
}

exports.create_thread = create_thread
