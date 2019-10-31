export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
};

export const selectPoke = state => {
  return Object.values(state.entities.pokemon)[0];
};