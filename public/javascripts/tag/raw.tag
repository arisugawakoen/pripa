<raw>
  <span></span>

    addAutoLink(string) {
      return string.replace(
        /((https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+))/gi,
        function (all, url, normal) {
          if (url) {
            return '<a href="' + url + '" target="_blank">' + url + '</a>'
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

</raw>
