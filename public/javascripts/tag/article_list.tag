<article-list>

  <div if={ articleListResults.length }>

<hr>

    <div class="content" each={ articleListResults }>
      { post }
      <br>
      <small><strong>{ name }</strong> { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }</small>
    </div>
  </div>

    var articleListResults = []
    var fetchUrl = './'
//    var limit = 10
    var self = this

    listArticle(id) {
      var url
      id = id || opts.id || 0

      if (opts.limit) {
        url = fetchUrl + 'articles/' + id + '/' + opts.limit
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

    el.on('threadViewRooter', (id) => {
      this.listArticle(id)
    })

</article-list>
