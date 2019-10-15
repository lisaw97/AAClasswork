Function.prototype.inherits = function(parent) {
  // function Surrogate() {}
  // Surrogate.prototype = parent.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject(name) { 
  this.name = name;
}

function Ship(name) {
  this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid(name) {
  this.name = name;
}
Asteroid.inherits(MovingObject);

MovingObject.prototype.moveLeft = function () {
  console.log(`${this.name} moved left`);
};

Ship.prototype.moveShip = function () {
  console.log(`${this.name} moved ship`);
};

Asteroid.prototype.moveAsteroid = function () {
  console.log(`${this.name} moved asteroid`);
};