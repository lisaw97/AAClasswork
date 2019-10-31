export const fetchAllPokemon = ()=>{
  return ($.ajax({
  url: '/api/pokemon',
  method: 'GET'
}));
};

export const fetchPoke = (id) => {
  const url = '/api/pokemon/' + id;
  return ($.ajax({
    url: url,
    method: 'GET'
  }));
};