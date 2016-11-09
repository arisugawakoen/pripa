<search-form>
  <form onsubmit={ ask } class="control is-horizontal"
   style="margin-bottom: 1em;>
    <div class="control has-addons">
      <input class="input is-expanded is-warning" type="text"
       placeholder="Search" name="input" onchange={ edit }>
      <button class="button is-warning">検索</button>
    </div>
  </form>

    if (opts.query) this.input.value = opts.query

    edit(e) {
      this.text = e.target.value
    }

    ask(e) {
      if (this.text) {
        searchArticles(this.text)
      }
    }

</search-form>
