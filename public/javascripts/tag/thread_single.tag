<thread-single>

  <div class="card is-fullwidth" style="margin-bottom: 1em; box-shadow: 0 0 0;">

<thread-view id={ threadId }></thread-view>
<tab-list id={ threadId }></tab-list>
<article-post id={ threadId }></article-post>

  </div>

    this.threadId = 0
    var self = this
    el = riot.observable()

    riot.route((id, action) => {
      console.log('id: ', id)
      console.log('action: ', action)

      self.threadId = id
      el.trigger('threadViewRooter', id, action)
    })

    riot.route.start(true)

</thread-single>
