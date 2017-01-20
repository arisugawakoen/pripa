<thread-single>

  <div class="box">
    <div class="card is-fullwidth" style="box-shadow: 0 0 0;">

<thread-view id={ threadId }></thread-view>
<tab-list id={ threadId }></tab-list>
<article-post id={ threadId }></article-post>

    </div>
  </div>

    threadId = opts.id || 0
    var self = this
    el = riot.observable()

    globalId = 0
    globalAction = ''

    route(function(id, action) {
      globalId = id      
      globalAction = action

      threadId = id
      self.update()
      el.trigger('threadViewRooter', id, action)
    })

    route.start(true)

  <style scoped>

    .box {
      word-wrap: break-word;
      line-height: 1.8;
      font-size: 1.1em;
    }

  </style>

</thread-single>
