<thread-single>

  <div class="card is-fullwidth" style="margin-bottom: 1em; box-shadow: 0 0 0;">

<thread-view id={ threadId }></thread-view>
<tab-list id={ threadId }></tab-list>
<article-post id={ threadId }></article-post>

  </div>

    this.threadId = 0
    var self = this
    el = riot.observable()

    riot.route((id) => {
      var strId = id.toString()
      var rooterMatch = strId.match(/^(\d+)_(\w+)$/)

      console.log(rooterMatch)
      if (rooterMatch) {
        self.threadId = parseInt(rooterMatch[1])
        console.log(rooterMatch[2])
      } else {
        self.threadId = id
      }

      el.trigger('threadViewRooter', id)
    })

    riot.route.start(true)


</thread-single>
