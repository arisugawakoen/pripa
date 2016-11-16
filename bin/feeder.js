'use strict'

const feed2DB = require('./feed2DB.js')
const models = require('../models')

const url = 'http://www.aviationwire.jp/feed'

feed2DB.stream(url)
