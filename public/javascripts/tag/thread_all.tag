<thread-all>
  <div class="message is-danger" style="margin-bottom: 1em;">
    <div class="message-body">
      スレッド一覧
      <span each={ results }>{ title } </span>
    </div>
  </div>

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

    el.on('allThreadUpdate', () => {
      this.allThread()
    })

</thread-all>
