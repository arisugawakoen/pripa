<toggle-switch>

  <div class="control is-grouped" style="margin-bottom: 1em;">
    <p class="control">
      <a class="button is-danger" onclick={ toggleThreadCreate }>
        スレッド作成
      </a>
    </p>
    <p class="control">
      <a class="button is-success" onclick={ toggleArticleView }>
        表示変更
      </a>
    </p>
    <p class="control">
      <a class="button is-primary" onclick={ toggleThreadAll }>
        スレッド一覧表示
      </a>
    </p>
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
