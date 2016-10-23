<thread-all>
  <div class="message is-primary" style="margin-bottom: 1em;" if={ flagThreadAll }>
    <div class="message-body">
      スレッド一覧
      <span each={ results }><a href="./thread.html#{ id }">{ title }</a> </span>
    </div>
  </div>

    var flagThreadAll = false
    var results = []
    var fetchUrl = './'
    var self = this

    allThread() {
      fetch(fetchUrl + 'threads/' + opts.board + '/all')
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.results = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.allThread()

    el.on('allThreadReload', () => {
      this.allThread()
    })

    el.on('toggleThreadAll', (toggle) => {
      self.flagThreadAll = toggle
      self.update()
    })

</thread-all>
