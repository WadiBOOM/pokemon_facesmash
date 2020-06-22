import consumer from "./consumer";

const initPokemonCable = () => {
  const pokemonsContainer = document.getElementById("pokemons-container");
  if (pokemonsContainer) {
    consumer.subscriptions.create({ channel: "PokemonChannel", room: "pokemons"}, {
      received(data) {
        pokemonsContainer.innerHTML = data;
      },
    });
  };
  const pokemonsPointsContainer = document.getElementById("pokemon-points-container")
  if (pokemonsPointsContainer) {
    const id = pokemonsPointsContainer.dataset.pokemonId

    consumer.subscriptions.create({ channel: "PokemonChannel", id: id}, {
      received(data) {
        pokemonsPointsContainer.innerHTML = data;
      },
    });
  };
}

export { initPokemonCable };
