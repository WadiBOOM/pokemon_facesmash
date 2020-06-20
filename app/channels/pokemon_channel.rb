class PokemonChannel < ApplicationCable::Channel
  def subscribed
    pokemon = Pokemon.all
    stream_for pokemon
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
