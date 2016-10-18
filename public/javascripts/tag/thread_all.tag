<thread-all>
  <div class="message is-danger">
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

</thread-all>