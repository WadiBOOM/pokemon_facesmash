class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.order("ranking DESC").first(10)
    @pokemons_to_rate = @pokemons.sample(2)
    PokemonChannel.broadcast_to(
      @pokemons,
      render_to_string(partial: "pokemon", locals: { pokemons: @pokemons })
      )
    # ActionCable.server.broadcast(
    #     'pokemons', pokemons: @pokemons
    #   )
  end

  def update
    if params[:id].blank?
      raise
    else
      @pokemon = Pokemon.find(params[:id])
      @pokemon.ranking += 151
      @pokemon.save!
      @pokemons = Pokemon.order("ranking DESC").first(10)
      PokemonChannel.broadcast_to(
      @pokemons,
      render_to_string(partial: "pokemon", locals: { pokemons: @pokemons })
      )
      redirect_to root_path
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

end
