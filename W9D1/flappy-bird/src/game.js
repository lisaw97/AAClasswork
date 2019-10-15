import Level from './level.js';
import Bird from './bird.js';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  restart() {
    this.level = new Level(this.dimensions);
    this.bird = new Bird(this.dimensions);
    this.running = false;
    this.animate(this.level, this.bird);
  }

  animate(level, bird) {
    level.drawBackground(this.ctx);
    bird.animate(this.ctx);
    
  
  }

  play() {
    this.running = true;
    // this.animate(this.level, this.bird);
    if(this.running === true) {
      window.requestAnimationFrame(this.animate(this.level, this.bird));
    }
  }
}