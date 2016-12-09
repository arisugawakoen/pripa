<thread-table>
  <table class="table" style="margin-bottom: 1em;"
    if={ flagThreadAll }>
    <thead>
      <tr>
        <th>スレッドタイトル</th>
        <th>作成日時</th>
        <th>更新日時</th>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <th>Thread title</th>
        <th>Create date</th>
        <th>Update date</th>
      </tr>
    </tfoot>
    <tbody>
      <tr each={ results }>
        <td><a href="./thread.html#{ id }">{ title }</a></td>
        <td>{ moment.utc(create_date).format('YYYY-MM-DD ddd HH:mm:ss') }</td>
        <td>{ moment.utc(update_date).format('YYYY-MM-DD ddd HH:mm:ss') }</td>
      </tr>
    </tbody>
  </table>

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

</thread-table>
