<thread-list>

  <div each={ results }>
    <div class="card is-fullwidth" style="margin-bottom: 1em;">
      <header class="card-header">
        <p class="card-header-title">
          { title }
        </p>
      </header>
      <div class="card-content">
        <div class="content">
          { post }
          <br>
          <small><strong>{ name }</strong> { moment(date).format('YYYY-MM-DD dddd HH:mm:ss') }</small>
        </div>
      </div>
      <div class="tabs is-small" style="margin-bottom: 0px;">
        <ul>
          <li><a>全表示</a></li>
          <li><a>最新表示</a></li>
          <li><a>先頭表示</a></li>
          <li><a>返信</a></li>
        </ul>
      </div>
      <footer style="padding: 1em;">
        <div class="control is-horizontal">
          <div class="control has-addons">
            <input class="input is-info" type="text" placeholder="Name">
            <input class="input is-info" type="email" placeholder="Mail">
            <a class="button is-info">
              Post
            </a>
          </div>
        </div>
        <div class="control is-horizontal">
          <div class="control">
            <textarea class="textarea is-info" placeholder="article"></textarea>
          </div>
        </div>
      </footer>
    </div>
  </div>

    var results = []
    var fetchUrl = './'
    var offset = 0
    var limit = 30
    var self = this

    listThread() {
      console.log(fetchUrl + 'threads/' + opts.board + '/' + offset + '/' + limit)
      fetch(fetchUrl + 'threads/' + opts.board + '/' + offset + '/' + limit)
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.results = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.listThread()

    el.on('allThreadUpdate', () => {
      this.listThread()
    })

</thread-list>
