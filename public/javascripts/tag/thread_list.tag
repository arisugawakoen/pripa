<thread-list>

  <div each={ results }>
    <div class="card is-fullwidth"
     style="margin-bottom: 1em; box-shadow: 0 0 0;">
      <header class="card-header">
        <p class="card-header-title">
          <a href="./thread.html#{ id }">{ title }</a>
        </p>
      </header>
      <div class="card-content">
        <div class="content">
          <raw content={ post }></raw>
          <br>
          <small>
            <strong>{ name }</strong>
            { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
          </small>
        </div>

<article-list id={ id } limit=10></article-list>

      </div>

<tab-list id={ id }></tab-list>
<article-post id={ id }></article-post>

    </div>
  </div>

    globalId = 0
    globalAction = ''

    var results = []
    var fetchUrl = './'
    var offset = 0
    var threadLimit = 10
    var articleLimit = 10
    var self = this

    listThread() {
      fetch(fetchUrl + 'threads/' + opts.board + '/' + offset + '/' + threadLimit)
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.results = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.listThread()

    el.on('allThreadReload', () => {
      this.listThread()
    })

</thread-list>
