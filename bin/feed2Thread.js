'use strict'

const createThread = require('./create_thread.js')
const models = require('../models')
const async = require('async')

models.feed.sequelize.query(
  "select title, link, summary from feeds where date between DATE_SUB(NOW(),INTERVAL 1 DAY) AND NOW();",
  { type: models.sequelize.QueryTypes.SELECT }
).then((feeds) => {
  async.each(feeds, (feed) => {
    createThread.create_thread('test', feed.title, feed.summary + '\n' + feed.link, 'bot')
  })
})  

