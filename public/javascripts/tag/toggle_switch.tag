<toggle-switch>

  <div class="hero-foot">
    <nav class="tabs">
      <div class="container">
        <ul>
          <li>
            <a onclick={ toggleThreadCreate }>スレッド作成</a>
          </li>
          <li>
            <a onclick={ toggleThreadAll }>スレッド一覧</a>
          </li>
          <li>
            <a onclick={ toggleArticleView }>通報</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>

    var stateThreadCreate = false
    var stateArticleView = true
    var stateThreadAll = false
    
    toggleThreadCreate() {
      this.stateThreadCreate = !this.stateThreadCreate
      el.trigger("toggleThreadCreate", this.stateThreadCreate)
    }

    toggleArticleView() {
      this.stateArticleView = !this.stateArticleView
      el.trigger("toggleArticleView", this.stateArticleView)
    }

    toggleThreadAll() {
      this.stateThreadAll = !this.stateThreadAll
      el.trigger("toggleThreadAll", this.stateThreadAll)
    }

</toggle-switch>
