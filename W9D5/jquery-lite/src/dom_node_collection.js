class DOMNodeCollection {
  contructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html(str) {
    if (str) {
      for (let i = 0; i < this.htmlElements.length; i++) {
        this.htmlElements[i].innerHTML = str;
      }      
    } else {
      return this.htmlElements[0].innerHTML;
    }
  }
}

module.exports = DOMNodeCollection;