import consumer from "./consumer";

const initPokemonCable = () => {
  console.log("le fichier js est bien lancé");
  const pokemonsContainer = document.getElementById("pokemons-container");
  if (pokemonsContainer) {
    console.log("console log avant subscriptions");
    console.log(consumer);
    consumer.subscriptions.create({ channel: "PokemonChannel" }, {
      received(data) {
        console.log("console log apres subscriptions")
        console.log(data); // called when data is broadcast in the cable
        // pokemonsContainer.replaceWith(data)
      },
    });
  }
}

export { initPokemonCable };

