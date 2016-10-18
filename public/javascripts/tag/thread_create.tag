<thread-create>
  <form name="thread_create" onsubmit={ add } style="margin-bottom: 1em;">
    <div>
    <div class="control is-horizonral">
      <div class="control has-addons">
        <input class="input is-expanded is-danger" type="text" placeholder="title" onkeyup={ clickTitle }>
        <input class="input is-danger" type="text" placeholder="Name" onkeyup={ clickName }>
        <button class="button is-danger">スレッド作成</button>
      </div>
    </div>
    <div class="control is-horizontal">
      <div class="control">
        <textarea class="textarea is-danger" placeholder="article" onkeyup={ clickPost }></textarea>
      </div>
    </div>
    </div>
  </form>
 
    var fetchUrl = './'
    var self = this
    el = riot.observable()

    createThread(title, board, post, name, mail) {
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
          mail: mail
        })
      }).then(() => {
        self.update()
        el.trigger('allThreadUpdate')
      })
    }

    clickTitle(e) {
      this.title = e.target.value
    }

    clickName(e) {
      this.name = e.target.value
    }

    clickMail(e) {
      this.mail = e.target.value
    }

    clickPost(e) {
      this.post = e.target.value
    }

    add(e) {
      self.createThread(this.title, opts.board, this.post, this.name, '')
      this.title = this.mail = this.post = this.name = ''
      document.thread_create.reset()
    }

</thread-create>
