<article-list>

  <div if={ articleListResults }>
    <hr>
    <div class="content" each={ articleListResults }>
      <raw content={ post }></raw>
      <br>
      <small style="color: #4a4a4a;">
        <strong>{ name }</strong>
        { moment.utc(create_date).format('YYYY-MM-DD ddd HH:mm:ss') }
      </small>
    </div>
  </div>

    var articleListResults = []
    var fetchUrl = './'
    var self = this

    listArticle(id, action) {
      var url

      action = action || globalAction || ''
      id = id || opts.id || 0
      globalId = 0
      globalAction = ''


      if (opts.limit) {
        url = fetchUrl + 'articles/' + id + '/' + opts.limit
      } else if (action == 'top') {
        url = fetchUrl + 'articles/' + id + '/0/10'
      } else if (action == 'latest') {
        url = fetchUrl + 'articles/' + id + '/10'
      } else {
        url = fetchUrl + 'articles/' + id
      }

      fetch(url)
      .then(function(res) {
        return res.json()
      }).then(function(json) {
        self.articleListResults = JSON.parse(json)
      }).then(function() {
        self.update()
      })
    }

    self.listArticle()

    el.on('thisArticleReload', function(id) {
      if (id == opts.id) self.listArticle()
    })

    el.on('threadViewRooter', function(id, action) {
      self.listArticle(id, action)
    })

</article-list>
