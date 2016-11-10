<search-form>
  <form onsubmit={ ask } class="control is-horizontal"
   style="margin-bottom: 1em;>
    <div class="control has-addons">
      <input class="input is-expanded is-primary" type="text"
       placeholder="Search" name="input" onchange={ edit }>
      <button class="button is-primary">検索</button>
    </div>
  </form>

    if (opts.query) this.input.value = opts.query

    edit(e) {
      this.text = e.target.value
    }

    ask(e) {
      if (this.text) {
        searchArticles(this.text)
        searchThreads(this.text)
        searchTop(this.text)
      }
    }

</search-form>
