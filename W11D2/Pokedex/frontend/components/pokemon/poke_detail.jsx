import React from 'react';

class PokeDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    return this.props.requestPoke(this.props.match.params.id);
  }

  render() {
    const poke = this.props.poke;
    debugger
    return (
      <div>
        <img src={poke.image_url}/>
        <h3>{poke.name}</h3>
        <div>Type: {poke.type}</div>
        <div>Attack: {poke.attack}</div>
        <div>Defense: {poke.defense}</div>
        <div>Moves: {poke.moves}</div>
      </div>
    );
  }
}

export default PokeDetail;