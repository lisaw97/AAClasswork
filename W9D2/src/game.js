const Asteroid = require('./asteroid.js');
const CONSTANTS = {
  DIM_X: 1000,
  DIM_Y: 650,
  NUM_ASTEROIDS: 3
};

function Game(){
  this.asteroids = [];
  this.addAsteroids();
};

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {
    let randPos = this.randomPosition();
    this.asteroids.push(new Asteroid({pos: randPos, game: this}));
  }
  console.log("asteroids array: " + this.asteroids[0].color);
};

Game.prototype.randomPosition = function() {
  let x = Math.floor(Math.random() * CONSTANTS.DIM_X);
  let y = Math.floor(Math.random() * CONSTANTS.DIM_Y);

  return [x, y];
};

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];
  if (x > CONSTANTS.DIM_X) {
    x = 0;
  } else if (x < 0) {
    x = CONSTANTS.DIM_X;
  }

  if (y > CONSTANTS.DIM_Y) {
    y = 0;
  } else if (y < 0) {
    y = CONSTANTS.DIM_Y;
  }

  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);
  ctx.fillStyle = "skyblue";
  ctx.fillRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};

module.exports = Game;