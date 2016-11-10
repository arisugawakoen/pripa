<search-toggle>
  <form style="margin-bottom: 1em;" if={ flagSearchBox }
   action="./search.html" method="GET">
    <div class="control is-horizontal">
      <div class="control has-addons">
        <input class="input is-expanded is-primary" type="text"
         placeholder="search" name="q">
        <button class="button is-primary">検索</button>
      </div>
    </div>
  </form>
 
    var flagSearchBox = false
    var self = this

    el.on("toggleSearchBox", function(toggle) {
      self.flagSearchBox = toggle
      self.update()
    })

</search-toggle>
