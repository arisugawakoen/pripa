'use strict'

function create_thread(board, title, post, name) {
  const moment = require('moment')
  const models = require('../models')

  if (title && post) {
    name = name || null
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          "insert into threads (title, board_id, create_date, update_date, post, name) value ($1, (select id from boards where title=$2), $3, $3, $4, $5)",
          { bind: [title, board, moment().format(), post, name]}
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
