import React from 'react';
import Tile from './tile';

class Board extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {
    const grid = this.props.board.grid;

    return (
      <div className="board">
        {grid.map((row, rowIdx) => {
          return (
            <div key={rowIdx} className="row">
              {row.map((tile, tileIdx) => {
                return (
                  <Tile tile={tile} updateGame={this.props.updateGame} key={tileIdx}/>
                )
              })}
            </div>
          )
        })}
      </div>
    );
  }
}

export default Board;