<search-action>

  <div class="card is-fullwidth"
   style="margin-bottom: 1em; box-shadow: 0 0 0;">
    <header class="card-header">
      <p class="card-header-title">投稿検索結果</p>
    </header>
    <div class="card-content">
      <div class="content">
        <div each={ results }>
          <raw content={ post }></raw>
          <br>
          <small>
            board : { board_name } thread : { thread_title }　
            <strong>{ name }</strong>
            { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
          </small>
        </div>
      </div>
    </div>

    var results = []
    var isResult = true
    var fetchUrl = './'
    var hash = location.search.substring(1).split('&')
    var searchLimit = 3000
    var vars = {}
    var self = this

    hash.forEach(function(element) {
      var z = element.split('=', 2)
      vars[z[0]] = decodeURIComponent(z[1])
    })

    urlQuery = vars['q']

    searchArticles(query) {
      fetch(fetchUrl + 'search/article', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          query: query,
        })
      }).then(function(res) {
        return res.json()
      }).then(function(json) {
        self.results = JSON.parse(json)
      }).then(function() {
        self.isResult = (self.results.length) ? true : false
        self.update()
      })
    }

    if (urlQuery) this.searchArticles(urlQuery)

</search-action>
