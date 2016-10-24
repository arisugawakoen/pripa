<thread-view>

  <header class="card-header">
    <p class="card-header-title">
      <a href="./thread.html#{ id }">{ result.title }</a>
    </p>
  </header>
  <div class="card-content">
    <div class="content">
      { result.post }
      <br>
      <small>
        <strong>{ result.name }</strong>
        { moment.utc(result.create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
      </small>
    </div>

<article-list id={ opts.id }></article-list>

    this.result = ''    
    var fetchUrl = './'
    var self = this

    headThread(id) {
      id = id || opts.id || 0

      fetch(fetchUrl + 'threads/id/' + id)
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.result = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

    this.headThread()

    el.on('threadViewRooter', (id) => {
      this.headThread(id)
    })

</thread-view>
