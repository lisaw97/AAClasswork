import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(6, 7)
    };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({board: this.state.board});
  }

  render() {
    let result = "";
    let screen = "";
    let form = "";
    if (this.state.board.won()) {
      result = "Congrats, you won!!! :(";
      screen = "modal-screen";
      form = "modal-message";
    } else if (this.state.board.lost()) {
      result = "Sorry, you lost! :)!!!";
      screen = "modal-screen";
      form = "modal-message";
    }

    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
        <div className="modal">
          <div className={screen}></div>
          <div className={form}>
            {result}
          </div>
        </div>
      </div>
    )
  }
}

export default Game;