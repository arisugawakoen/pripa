<article-list>

  <div if={ articleListResults.length }>
    <div class="content" each={ articleListResults }>
      { post }
      <br>
      <small><strong>{ name }</strong> { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }</small>
    </div>
  </div>

    var articleListResults = []
    var fetchUrl = './'
    var limit = 10
    var self = this

    listArticle() {
      fetch(fetchUrl + 'articles/' + opts.id + '/' + limit)
      .then((res) => {
        return res.json()
      }).then((json) => {
        this.articleListResults = JSON.parse(json)
      }).then(() => {
        console.log(this.articleListResults)
        self.update()
      })
    }

    this.listArticle()

    el.on('thisArticleReload', (id) => {
      if (id == opts.id) this.listArticle()
    })

</article-list>
