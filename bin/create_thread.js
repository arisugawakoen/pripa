'use strict'

function create_thread(board, title, post, name, mail) {
  const moment = require('moment')
  const models = require('../models')

  if (title && post) {
    name = name || null
    mail = mail || null
    models.board.findOne({
      attributes: ['id'],
      where: {
        title: board
      }
    }).then((result) => {
      if (result) {
        models.board.sequelize.query(
          "insert into threads (title, board_id, date, post, name, mail) value ($1, (select id from boards where title=$2 ), $3, $4, $5, $6)",
          { bind: [title, board, moment().format(), post, name, mail]}
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
