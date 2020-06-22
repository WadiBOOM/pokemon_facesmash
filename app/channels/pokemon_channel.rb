class PokemonChannel < ApplicationCable::Channel
  def subscribed
    if params[:id]
      pokemon = Pokemon.find(params[:id])
      stream_for pokemon
    else
      stream_from "pokemons"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
