<thread-all>
  <div class="message is-primary" style="margin-bottom: 1em;"
    if={ flagThreadAll }>
    <div class="message-body">
      スレッド一覧
      <span each={ results }>
        <a href="./thread.html#{ id }">{ title }</a>
      </span>
    </div>
  </div>

    var flagThreadAll = false
    var results = []
    var fetchUrl = './'
    var self = this

    allThread() {
      fetch(fetchUrl + 'threads/' + opts.board + '/all')
      .then(function(res) {
        return res.json()
      }).then(function(json) {
        self.results = JSON.parse(json)
      }).then(function() {
        self.update()
      })
    }

    self.allThread()

    el.on('allThreadReload', function() {
      self.allThread()
    })

    el.on('toggleThreadAll', function(toggle) {
      self.flagThreadAll = toggle
      self.update()
    })

</thread-all>
