import consumer from "./consumer";

const initPokemonCable = () => {
  const pokemonsContainer = document.getElementById('pokemons-container');
  if (pokemonsContainer) {
    console.log("console log avant subscriptions");
    consumer.subscriptions.create({ channel: "PokemonChannel" }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        // pokemonsContainer.replaceWith(data)
      },
    });
  }
}

export { initPokemonCable };

