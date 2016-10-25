<article-list>

  <div if={ articleListResults.length }>
    <hr>
    <div class="content" each={ articleListResults }>
      <raw content={ post }></raw>
      <br>
      <small>
        <strong>{ name }</strong>
        { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
      </small>
    </div>
  </div>

    var articleListResults = []
    var fetchUrl = './'
    var self = this

    listArticle(id, action) {
      var url

      console.log('arg.id:', id)
      console.log('arg.action:', action)

      if (globalId) console.log('received-global.id:', globalId)
      if (globalAction) console.log('received-global.action:', globalAction)

      action = action || globalAction || ''
      id = id || opts.id || 0
      globalId = 0
      globalAction = ''

      console.log('opts.limit: ', opts.limit)
      console.log('opts.id: ', opts.id)
      console.log('function-id: ', id)
      console.log('function-action: ', action)

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
      .then((res) => {
        return res.json()
      }).then((json) => {
        this.articleListResults = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.listArticle()

    el.on('thisArticleReload', (id) => {
      if (id == opts.id) this.listArticle()
    })

    el.on('threadViewRooter', (id, action) => {
      console.log('event-id: ', id)
      console.log('event-action: ', action)
      this.listArticle(id, action)
    })

</article-list>
