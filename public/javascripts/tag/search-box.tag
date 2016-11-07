<search-box>
  <form style="margin-bottom: 1em;" if={ flagSearchBox }
   action="./search.html" method="GET">
    <div class="control is-horizonral">
      <div class="control has-addons">
        <input class="input is-expanded is-warning" type="text"
         placeholder="search" name="q">
        <button class="button is-warning">検索</button>
      </div>
    </div>
  </form>
 
    var flagSearchBox = false
    var fetchUrl = './'
    var self = this

    el.on("toggleSearchBox", function(toggle) {
      self.flagSearchBox = toggle
      self.update()
    })

</search-box>
