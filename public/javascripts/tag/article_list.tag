<article-list>

  <div if={ results.length }>
    <div class="content" each={ results }>
      { post }
      <br>
      <small><strong>{ name }</strong> { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }</small>
    </div>
  </div>

    var results = []
    var fetchUrl = './'
    var self = this

    listArticle() {
      fetch(fetchUrl + 'articles/' + opts.id)
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.results = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.listArticle()

    el.on('thisArticleReload', (id) => {
      if (id == opts.id) this.listArticle()
    })

</article-list>
