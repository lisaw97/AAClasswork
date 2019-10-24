import React from 'react';
import * as Minesweeper from '../minesweeper';

class Tile extends React.Component {
  constructor(props) {
    super(props);
  }

  handleClick(e) {
    console.log(e);
    this.props.updateGame(this.props.tile, e.altKey);
  }

  render() {
    const tile = this.props.tile;
    let result = "";
    let revealed = "tile";
    if (tile.explored === true && tile.bombed === false) {
      revealed = "tile revealed";
    } else {
      revealed = "tile";
    }
    if (tile.explored === true && tile.adjacentBombCount() > 0) {
      result = tile.adjacentBombCount();
      // revealed = "tile revealed";
    } else if (tile.explored === true && tile.bombed === true) {
      result = <span className="bombed">&#128163;</span>;
    } else if (tile.flagged === true) {
      result = <span className="flagged">&#9872;</span>
    }

    return (
      <div className={revealed} onClick={(e) => this.handleClick(e)}>
        {result}
      </div>
    )
  }
}

export default Tile;
