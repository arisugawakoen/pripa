<thread-list>

  <div each={ results } class="box">
    <div class="card is-fullwidth"
     style="box-shadow: 0 0 0;">
      <header class="card-header">
        <p class="card-header-title">
          <a href="./thread.html#{ id }/top">{ title }</a>
        </p>
      </header>
      <div class="card-content">
        <div class="content">
          <raw content={ post }></raw>
          <br>
          <small style="color: #4a4a4a">
            <strong>{ name }</strong>
            { moment.utc(create_date).format('YYYY-MM-DD ddd HH:mm:ss') }
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
    var threadLimit = 20
    var articleLimit = 10
    var self = this

    listThread() {
      fetch(fetchUrl + 'threads/' + opts.board + '/' + offset + '/' + threadLimit)
      .then(function(res) {
        return res.json()
      }).then(function(json) {
        self.results = JSON.parse(json)
      }).then(function() {
        self.update()
      })
    }

    self.listThread()

    el.on('allThreadReload', function() {
      self.listThread()
    })

  <style scoped>

    .box {
      word-wrap: break-word;
      line-height: 2;
      font-size: 1.1em;
      letter-spacing:0.05em;
    }

  </style>

</thread-list>
