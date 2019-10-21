const DOMNodeCollection = require('./dom_node_collection.js');

const $l = function(selector) {
  if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  } else {
    let nodeList = Array.from(document.querySelectorAll(selector));
    return new DOMNodeCollection(nodeList);
  }
  
};

window.$l = $l;