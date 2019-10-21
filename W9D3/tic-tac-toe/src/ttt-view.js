class View {
  constructor(game, $el) {

    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    let $li = $('li');
    let that = this;
    $li.on('click', function(e) {
      let $square = $(e.target);
      if ($square.hasClass('hit')) {
        alert("Hey mate, its bloody occupied");
      } else {
        that.game.playMove($(e.target).data().pos);
        that.makeMove($(e.target));
      }
    });

  }

  makeMove($square) {
    let gal = this.game.currentPlayer;
    $square.text(this.game.currentPlayer);
    $square.addClass('hit');
    if (this.game.isOver()) {
      let $p = $('<p>').text('You are the bloody Winner mate!  '+ gal.toUpperCase());
      this.csv.append($p);
      $('li').off('click');
    } 
  }

  setupBoard() {
    this.$el.append('<ul>');
    let $ul = $('ul');
    
    for (let i = 0; i < 3; i++) {
      let $div = $('<div>');
      $ul.append($div);
      for (let j = 0; j < 3; j++) {
        let $li = $('<li>');
        $li.data('pos', [i, j]);
        $div.append($li);
      }
    }
  }


}

// View.prototype.setupBoard = function() {
//   // var countries = ['United States', 'Canada', 'Argentina', 'Armenia'];
//   const $ul = Array.from($('<ul>'));
//   const $li = $('<li/>')
//   let twoD = Array.from(Array(3), () => new Array(3))
//   debugger
//   $ul.each(ul, function (e) {
//       .addClass('ui-menu-item')
//       .attr('role', 'menuitem')
//       .appendTo(ul);
    
//   });
//   // const $ul = Array.from($('<ul>'));
//   // for (let i = 0; i < $ul.length; i++) {
//   //   for (let j = 0; j < $ul.length; j++) {

//   //   }
//   // }
// };

module.exports = View;
