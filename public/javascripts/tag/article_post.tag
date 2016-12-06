<article-post>

  <footer style="padding: 1em;">
    <form name="article_post" onsubmit={ add }>
      <div class="control is-horizontal">
        <div class="control">
          <textarea class="textarea is-info" placeholder="Article"
            name="article" onchange={ inputArticle }></textarea>
        </div>
      </div>
      <div class="control is-horizontal">
        <div class="control has-addons">
          <input class="input is-info" type="text" placeholder="Name"
            name="name" onchange={ inputName }>
          <button class="button is-info" onclick={ add } type="button">
            Post
          </button>
        </div>
      </div>
    </form>
  </footer>

    var fetchUrl = './'
    var self = this

    postArticle(threadId, name, post) {
      if (post) {
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
        }).then(function() {
          el.trigger('thisArticleReload', threadId)
          el.trigger('allThreadReload')
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
      if (this.article) {
        self.postArticle(opts.id, this.replyName, this.article)
        this.replyName = this.article = ''
        document.querySelector('textarea.textarea.is-info').value = ''
        document.querySelector('input.input.is-info').value = ''
      }
    }

</article-post>
