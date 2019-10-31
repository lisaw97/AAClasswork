import React from 'react';
import {Link} from 'react-router-dom';

const PokemonIndexItem = (props) =>{
  return (
    <li>   
      <img className="small" src={props.poke.image_url} />
      <Link to={"/pokemon/" + props.poke.id}>
        {props.poke.name}
      </Link>
    </li>
  );
};

export default PokemonIndexItem;