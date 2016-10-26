<thread-single>

  <div class="card is-fullwidth" style="margin-bottom: 1em; box-shadow: 0 0 0;">

<thread-view id={ threadId }></thread-view>
<tab-list id={ threadId }></tab-list>
<article-post id={ threadId }></article-post>

  </div>

    threadId = 0
    var self = this
    el = riot.observable()

    globalId = 0
    globalAction = ''

    riot.route(function(id, action) {
      globalId = id      
      globalAction = action

      threadId = id
      self.update()
      el.trigger('threadViewRooter', id, action)
    })

    riot.route.start(true)

</thread-single>
