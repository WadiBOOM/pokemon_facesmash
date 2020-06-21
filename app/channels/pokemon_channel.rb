class PokemonChannel < ApplicationCable::Channel
  def subscribed
    pokemons = Pokemon.all
    stream_for pokemons
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
