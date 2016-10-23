<thread-create>
  <form name="thread_create" onsubmit={ add } style="margin-bottom: 1em;" if={ flagThreadCreate }>
    <div>
    <div class="control is-horizonral">
      <div class="control has-addons">
        <input class="input is-expanded is-danger" type="text" placeholder="title" onkeyup={ keyupTitle }>
        <input class="input is-danger" type="text" placeholder="Name" onchange={ keyupName }>
        <button class="button is-danger">スレッド作成</button>
      </div>
    </div>
    <div class="control is-horizontal">
      <div class="control">
        <textarea class="textarea is-danger" placeholder="article" onchange={ keyupPost }></textarea>
      </div>
    </div>
    </div>
  </form>
 
    var flagThreadCreate = false
    var fetchUrl = './'
    var self = this
    el = riot.observable()

    createThread(title, board, post, name) {
      if (title.length && post.length) {
        fetch(fetchUrl + 'threads/' + board, {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            title: title,
            board: board,
            post: post,
            name: name,
          })
        }).then(() => {
          el.trigger('allThreadReload')
        }).then(() => {
          self.update()
        })
      } else {
        return false
      }
    }

    keyupTitle(e) {
      this.title = e.target.value
    }

    keyupName(e) {
      this.name = e.target.value
    }

    keyupPost(e) {
      this.post = e.target.value
    }

    add(e) {
      if (this.title && this.post) {
        self.createThread(this.title, opts.board, this.post, this.name, '')
        this.title = this.post = this.name = ''
        document.thread_create.reset()
      }
    }

    el.on("toggleThreadCreate", (toggle) => {
      self.flagThreadCreate = toggle
      self.update()
    })

</thread-create>
