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
            <a onclick={ toggleSearchBox }>検索</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>

    var stateThreadCreate = false
    var stateSearchBox = false
    var stateThreadAll = false
    
    toggleThreadCreate() {
      this.stateThreadCreate = !this.stateThreadCreate
      el.trigger("toggleThreadCreate", this.stateThreadCreate)
    }

    toggleSearchBox() {
      this.stateSearchBox = !this.stateSearchBox
      el.trigger("toggleSearchBox", this.stateSearchBox)
    }

    toggleThreadAll() {
      this.stateThreadAll = !this.stateThreadAll
      el.trigger("toggleThreadAll", this.stateThreadAll)
    }

</toggle-switch>
