<thread-single>

  <div class="card is-fullwidth" style="margin-bottom: 1em; box-shadow: 0 0 0;">

<thread-view id={ threadId }></thread-view>
<tab-list id={ threadId }></tab-list>
<article-post id={ threadId }></article-post>

  </div>

    this.threadId = 0
    var self = this
    el = riot.observable()

    globalId = 0
    globalAction = ''

    riot.route((id, action) => {
      console.log('rooter-id: ', id)
      console.log('rooter-action: ', action)

      globalId = id      
      globalAction = action

      console.log('global-id: ', globalId)
      console.log('global-action: ', globalAction)

      self.threadId = id
      el.trigger('threadViewRooter', id, action)
    })

    riot.route.start(true)

</thread-single>
