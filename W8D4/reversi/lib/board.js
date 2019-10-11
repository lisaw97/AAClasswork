let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) { 
  if (!this.isValidPos(pos)) {
    throw new Error('Invalid position');
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let curPiece = this.getPiece(pos);
  if (curPiece === undefined) {
    return false;
  }
  return (curPiece.color === color);
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (!this.isValidPos(pos)) {
    return false;
  }
  let curPiece = this.getPiece(pos);
  if (curPiece === undefined) {
    return false;
  }
  return true;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !(this.hasMove("black") || this.hasMove("white"));
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  if (board.isMine(pos, color)) {
    return piecesToFlip;
  }

  piecesToFlip.push(board.getPiece(pos));
  nextPos = [pos[0] + dir[0], pos[1] + dir[1]];
  return _positionsToFlip(board, nextPos, color, dir, piecesToFlip);
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('Cannot place piece here!');
  } else {
    this.grid[pos[0]][pos[1]] = new Piece(color);
    let flips = [];
    let validDirs = this.validDirections(pos, color);
    for (let dir of validDirs) {
      startPos = [pos[0] + dir[0], pos[1] + dir[1]];
      flips = flips.concat(_positionsToFlip(this, startPos, color, dir, []));
    }
    for (let piece of flips) {
      piece.flip();
    }
    
  }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log("  0 1 2 3 4 5 6 7");
  for (let i = 0; i < this.grid.length; i++) {
    console.log(`${i} ` + this.grid[i].join("  "));
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }

  let validDirs = this.validDirections(pos, color);
  for (let dir of validDirs) {
    let start = [pos[0] + dir[0], pos[1] + dir[1]];
    while (this.isValidPos(start) && this.isOccupied(start)) {
      if (this.isMine(start, color)) {
        // _positionsToFlip()
        return true;
      }
      start = [start[0] + dir[0], start[1] + dir[1]];
    }
  }
  return false;
};

// Return arr of directions where neighbors are of the opposite color
Board.prototype.validDirections = function (pos, color) {
  let validDirections = [];
  for (let dir of Board.DIRS) {
    let neighborPos = [pos[0] + dir[0], pos[1] + dir[1]];
    if (this.isOccupied(neighborPos) && !this.isMine(neighborPos, color)) {
      validDirections.push(dir);
    }
  }
  return validDirections;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMoves = [];
  debugger;
  for (let row = 0; row < 8; row++) {
    for (let column = 0; column < 8; column++) {
      let pos = [row, column];

      if (this.validMove(pos, color) && !this.isOccupied(pos)) {
        validMoves.push(pos);
      }
    }
  }
  return validMoves;
};



module.exports = Board;
