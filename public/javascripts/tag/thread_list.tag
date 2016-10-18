<thread-all>

  <div each={ results }>
    <div class="card is-fullwidth">
      <header class="card-header">
        <p class="card-header-title">
            スレッドタイトル
          </p>
        </header>
        <div class="card-content">
          <div class="content">
            スレッドコンテンツあああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
            <br>
            <small><strong>1</strong> 2016-10-12 Friday 11:09</small>
          </div>
          <div class="content">
            スレッドコンテンツ
            <br>
            <small><strong>2</strong> 2016-10-12 Friday 11:10</small>
          </div>
          <div class="content">
            スレッドコンテンツ
            <br>
            <small><strong>3</strong> 2016-10-12 Friday 11:11</small>
          </div>
          <div class="content">
            スレッドコンテンツ
            <br>
            <small><strong>4</strong> 2016-10-12 Friday 11:12</small>
          </div>
          <div class="content">
            スレッドコンテンツ
            <br>
            <small><strong>5</strong> 2016-10-12 Friday 11:13</small>
          </div>
        </div>
        <div class="tabs" style="margin-bottom: 0px;">
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
