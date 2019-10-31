import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchAllPokemon} from './util/api_util';
// import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
// import {selectAllPokemon} from './reducers/selectors';
import {fetchPoke} from './util/api_util';

document.addEventListener("DOMContentLoaded", () => {
  window.fetchAllPokemon = fetchAllPokemon;
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.selectAllPokemon = selectAllPokemon;
  window.fetchPoke = fetchPoke;
  const store = configureStore();
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
});