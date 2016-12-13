<thread-view>

  <header class="card-header">
    <p class="card-header-title">
      <a href="./{ result.board_name }.html">{ result.board_name }：</a>
      <a href="./thread.html#{ result.id }">{ result.title }</a>
    </p>
  </header>
  <div class="card-content">
    <div class="content">
      <raw content={ result.post }></raw>
      <br>
      <small style="color: #4a4a4a">
        <strong>{ result.name }</strong>
        { moment.utc(result.create_date).format('YYYY-MM-DD ddd HH:mm:ss') }
      </small>
    </div>

<article-list id={ opts.id }></article-list>

    this.result = ''    
    var fetchUrl = './'
    var self = this

    headThread(id) {
      id = id || opts.id || 0

      if (id) {
        fetch(fetchUrl + 'threads/id/' + id)
        .then(function(res) {
          return res.json()
        }).then(function(json) {
          self.result = JSON.parse(json)
        }).then(function() {
          riot.mount('raw')      
          self.update()
        })
      }
    }

    self.headThread()

    el.on('threadViewRooter', function(id) {
      self.headThread(id)
    })

</thread-view>
