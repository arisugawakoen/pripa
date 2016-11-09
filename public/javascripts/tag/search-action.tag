<search-action>

  <search-form query={ urlQuery }></search-form>

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
            board : <strong><a href="./{ board_name }.html">{ board_name }</a></strong>
            thread : <strong><a href="./thread.html#{ thread_id }">{ thread_title }</a></strong>
            <span if={ name.length }>name : <strong>{ name }</strong></span>
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

    searchArticles = function(query) {
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

    if (urlQuery) searchArticles(urlQuery)

</search-action>
