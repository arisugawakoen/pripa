'use strict'

function stream(feed) {
  const FeedParser = require('feedparser')
  const request = require('request')
  const models = require('../models')
  const req = request(feed)

  const feedparser = new FeedParser()

  let items = []

  req.on('error', (err) => {
    console.log(feed)
    console.log(err)
    return
  })

  req.on('response', (res) => {
    let stream = req
    if (res.statusCode != 200) {
      console.log(feed)
      req.emit('error', new Error('Bad status code'))
    }
    stream.pipe(feedparser)
  })

  feedparser.on('readable', () => {
    let item
    while(item = feedparser.read()) {
      items.push(item)
    }
  })

  feedparser.on('end', () => {
    items.forEach((item) => {
      if (item.guid) {
        models.feed.findOrCreate({
          where: { guid: item.guid },
          defaults: {
            title: item.title,
            link: item.link,
            metaTitle: item.meta.title,
            metaLink: item.meta.link,
            date: item.date,
            summary: item.summary,
            description: item.description
          }
        })
      }
    })
  })
}

exports.stream = stream
