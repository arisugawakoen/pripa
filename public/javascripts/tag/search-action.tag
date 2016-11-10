<search-action>

  <search-form query={ urlQuery }></search-form>

  <div class="card is-fullwidth"
   style="margin-bottom: 1em; box-shadow: 0 0 0;">
    <header class="card-header">
      <p class="card-header-title">スレッドタイトル検索結果</p>
    </header>
    <div class="card-content">
      <div class="content" if={ resultsThread.length }>
        <div each={ resultsThread }>
            <a href="./{ board_name }.html">{ board_name }</a> :
            <a href="./thread.html#{ thread_id }">{ thread_title }</a>
            <span if={ name.length }>name : { name }</span>
          <small>
            { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
          </small>
        </div>
      </div>
      <div class="content" if={!isResultThread }>
        検索結果なし
      </div>
    </div>
  </div>

  <div class="card is-fullwidth"
   style="margin-bottom: 1em; box-shadow: 0 0 0;">
    <header class="card-header">
      <p class="card-header-title">スレッド先頭投稿検索結果</p>
    </header>
    <div class="card-content">
      <div if={ resultsTop.length }>
        <div class="content" each={ resultsTop }>
          <raw content={ post }></raw>
          <br>
          <small>
            <a href="./{ board_name }.html">{ board_name }</a> :
            <a href="./thread.html#{ thread_id }">{ thread_title }</a>
            <span if={ name.length }>name : { name }</span>
            { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
          </small>
        </div>
      </div>
      <div class="content" if={!isResultTop }>
        検索結果なし
      </div>
    </div>
  </div>

  <div class="card is-fullwidth"
   style="margin-bottom: 1em; box-shadow: 0 0 0;">
    <header class="card-header">
      <p class="card-header-title">投稿検索結果</p>
    </header>
    <div class="card-content">
      <div if={ results.length }>
        <div class="content" each={ results }>
          <raw content={ post }></raw>
          <br>
          <small>
            <a href="./{ board_name }.html">{ board_name }</a> :
            <a href="./thread.html#{ thread_id }">{ thread_title }</a>
            <span if={ name.length }>name : { name }</span>
            { moment.utc(create_date).format('YYYY-MM-DD dddd HH:mm:ss') }
          </small>
        </div>
      </div>
      <div class="content" if={!isResult }>
        検索結果なし
      </div>
    </div>
  </div>

    var results = []
    var resultsThread = []
    var resultsTop = []
    var isResult = true
    var isResultThread = true
    var isResultTop = true
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

    searchThreads = function(query) {
      fetch(fetchUrl + 'search/thread', {
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
        self.resultsThread = JSON.parse(json)
      }).then(function() {
        self.isResultThread = (self.resultsThread.length) ? true : false
        self.update()
      })
    }

    searchTop = function(query) {
      fetch(fetchUrl + 'search/thread_top', {
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
        self.resultsTop = JSON.parse(json)
      }).then(function() {
        self.isResultTop = (self.resultsTop.length) ? true : false
        self.update()
      })
    }

    if (urlQuery) {
      searchArticles(urlQuery)
      searchThreads(urlQuery)
      searchTop(urlQuery)
    }

</search-action>
