const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

function Asteroid(posHash) {
  this.COLOR = "yellow";
  this.RADIUS = 28;

  MovingObject.call(this, 
    {
      pos: posHash.pos,
      vel: Util.randomVec(12),
      radius: this.RADIUS,
      color: this.COLOR,
      game: posHash.game
    }
  );
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;