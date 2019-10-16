const Game = require('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  let that = this.game;
  setInterval(that.moveObjects.bind(that), 20);
  setInterval(that.draw.bind(that, this.ctx), 20);
};

module.exports = GameView;