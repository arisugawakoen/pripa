<tab-list>

  <div class="tabs is-small" style="margin-bottom: 0px;">
    <ul>
      <li><a href="./thread.html#{ tabId }">
        <strong if={ tabAction == undefined }>全表示</strong>
        <span if={ tabAction !== undefined }>全表示</span>
      </a></li>
      <li><a href="./thread.html#{ tabId }/latest">
        <strong if={ tabAction == "latest" }>最新表示</strong>
        <span if={ tabAction !== "latest" }>最新表示</span>
      </a></li>
      <li><a href="./thread.html#{ tabId }/top">
        <strong if={ tabAction == "top" }>先頭表示</strong>
        <span if={ tabAction !== "top" }>先頭表示</span>
      </a></li>
    </ul>
  </div>

    this.on('update', function() {
      tabId = opts.id || threadId
      tabAction = globalAction
    })

</tab-list>
