// const Game = require('./game.js');

function MovingObject(moveHash) {
  this.pos = moveHash.pos;
  this.vel = moveHash.vel;
  this.radius = moveHash.radius;
  this.color = moveHash.color;
  this.game = moveHash.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);
  ctx.fill();
};

MovingObject.prototype.move = function() {
  let x = this.pos[0] + this.vel[0];
  let y = this.pos[1] + this.vel[1];
  this.pos = this.game.wrap([x, y]);
};

module.exports = MovingObject;