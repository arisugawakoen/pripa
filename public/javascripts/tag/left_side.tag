<left-side>
  <div class="box" style="margin: 1em;">
  <aside class="menu">

    <p class="menu-label">
      ナビゲーション
    </p>

    <p class="menu-list">
      <a href="./">top page</a>
      <a href="./search.html">search</a>
    </p>

    <p class="menu-label">
      掲示板一覧
    </p>

    <ul class="menu-list">
      <li each={ boardListResults }>
        <a href="./{ title }.html">{ title }</a>
      </li>
    </ul>

  </aside>
  </div>

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
