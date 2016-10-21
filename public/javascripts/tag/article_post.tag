<article-post>

  <footer style="padding: 1em;">
    <form name="article_post" onsubmit={ add }>
      <div class="control is-horizontal">
        <div class="control has-addons">
          <input class="input is-info" type="text" placeholder="Name"
            name="name" onkeyup={ inputName }>
          <button class="button is-info">Post</button>
        </div>
      </div>
      <div class="control is-horizontal">
        <div class="control">
          <textarea class="textarea is-info" placeholder="Article"
            name="article" onkeyup={ inputArticle }></textarea>
        </div>
      </div>
    </form>
  </footer>

    var fetchUrl = './'
    var self = this

    postArticle(threadId, name, post) {
      if (post.length) {
        fetch(fetchUrl + 'articles/' + threadId, {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            thread_id: threadId,
            post: post,
            name: name,
          })
        }).then(() => {
          el.trigger('thisArticleReload', threadId)
        }).then(() => {
          el.trigger('allThreadReload')
        }).then(() => {
          self.update()
        })
      } else {
        return false
      }
    }

    inputName(e) {
      this.replyName = e.target.value
    }

    inputArticle(e) {
      this.article = e.target.value
    }
    
    add(e) {
      self.postArticle(opts.id, this.replyName, this.article)
      this.replyName = this.article = ''
    }

</article-post>
