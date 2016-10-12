'use strict'

const models = require('../models')

if (process.argv[2]) {
  models.board.findAll({
    title: process.argv[2],
  }).then((boards) => {
    if (boards.length) {
      models.board.destroy({
        where: {
          title: process.argv[2]
        }
      })
      console.log('Delete board name: ', process.argv[2])
    } else { 
      console.log('Board does not exist. Exit.')
    }    
  })
} else {
  console.log('Argument has not been specified. Exit.')
}

