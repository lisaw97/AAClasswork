const MovingObject = require("./moving_object.js");
const Game = require('./game.js');
const GameView = require('./game_view.js');

window.MovingObject = MovingObject;

const canvas = document.getElementById('game-canvas');
ctx = canvas.getContext("2d");

// const mo = new MovingObject({
//   pos: [30, 30],
//   vel: [10, 10],
//   radius: 5,
//   color: "#00FF00",
//   game: new Game()
// });

const gameView = new GameView(ctx);
gameView.start();
// const game = new Game();
// game.draw(ctx);