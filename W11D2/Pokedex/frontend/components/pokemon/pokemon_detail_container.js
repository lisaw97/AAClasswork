import { connect } from 'react-redux';
import PokeDetail from './poke_detail';
// import { selectPoke } from '../../reducers/selectors';
import {requestPoke} from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) =>{
  return {

    poke: state.entities.pokemon 
  };
};

const mapDispatchToProps = dispatch => ({
  requestPoke: (id) => dispatch(requestPoke(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokeDetail);