<thread-view>

  <header class="card-header">
    <p class="card-header-title">
      { title }
    </p>
  </header>
  <div class="card-content">
    <div class="content">
      { post }
      <br>
      <small><strong>{ name }</strong> { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }</small>
    </div>

<article-list id={ opts.id }></article-list>

    listThread() {
      fetch(fetchUrl + 'threads/' + opts.board + '/' + offset + '/' + limit)
      .then((res) => {
        return res.json()
      }).then((json) => {
        self.result = JSON.parse(json)
      }).then(() => {
        self.update()
      })
    }

</thread-view>
