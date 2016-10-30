<raw>
  <span></span>

    this.on('update', function() {
      addAutoLink(string) {
        return string.replace(
          /((https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+))/gi,
          function (all, url, normal) {
            if (url) {
              var youtubeCheck = /youtu/.test(url)
              var videoId = /[/?=]([-\w]{11})/.exec(url)
              if (youtubeCheck && videoId) {
                return '<iframe src="https://www.youtube.com/embed/' + videoId[1] + '?rel=0" frameborder="0" allowfullscreen></iframe>'
              } else {
                return '<a href="' + url + '" target="_blank">' + url + '</a>'
              }
            } else {
              return normal;
            }
          }
        )
      }

      nl2br(string) {
        return string.replace(/\n/g, '<br>')
      }

      var cont = opts.content || ''

      cont = this.addAutoLink(cont)
      cont = this.nl2br(cont)

      this.root.innerHTML = cont
    })
</raw>
