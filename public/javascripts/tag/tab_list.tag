<tab-list>

  <div class="tabs is-small" style="margin-bottom: 0px;">
    <ul>
      <li><a href="./thread.html#{ tabId }">全表示</a></li>
      <li><a href="./thread.html#{ tabId }/latest">最新表示</a></li>
      <li><a href="./thread.html#{ tabId }/top">先頭表示</a></li>
    </ul>
  </div>

    this.on('update', function() {
      tabId = opts.id || threadId
    })

</tab-list>
