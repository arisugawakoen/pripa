<left-side>

  <aside class="menu" style="padding: 1em;">
    <p class="menu-list">
      <a href="./">トップページ</a>
    </p>

    <p class="menu-label">
      掲示板一覧
    </p>

    <ul class="menu-list">
      <li each={ boardListResults }>
        <a href="./{ title }.html">{ title }</a>
      </li>
    </ul>

    <p class="menu-label">
      関係情報
    </p>

    <ul class="menu-list">
      <li><a href="https://github.com/arisugawakoen">GitHub</a></li>
      <li><a href="https://twitter.com/arisugawakoen">Twitter</a></li>
    </ul>

    <p class="menu-label">
      利用させていただいたプロダクト
    </p>

    <ul class="menu-list">
      <li><a href="https://nodejs.org/ja/">Node.js</a></li>
      <li><a href="http://expressjs.com/ja/">Express</a></li>
      <li><a href="http://riotjs.com/ja/">Riot.js</a></li>
      <li><a href="http://bulma.io/">Bulma</a></li>
      <li><a href="https://github.github.io/fetch/">Fetch</a></li>
      <li><a href="http://momentjs.com/">Moment.js</a></li>
      <li><a href="https://h2o.examp1e.net/">H2O</a></li>
      <li><a href="https://www.conoha.jp/">ConoHa</a></li>
    </ul>

  </aside>

    var boardListResults = []
    var fetchUrl = './'
    var self = this

    listBoards() {
      fetch(fetchUrl + 'boards/all')
      .then(function(res) {
        return res.json()
      }).then(function(json) {
        self.boardListResults = JSON.parse(json)
      }).then(function() {
        self.update()
      })
    }

    self.listBoards()

</left-side>
