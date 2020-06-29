class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.order("ranking DESC")
    @pokemons_to_rate = @pokemons.sample(2)

  end

  def update
    if params[:id].blank?
      raise
    else
      @pokemon = Pokemon.find(params[:id])
      @pokemon.ranking += 151
      @pokemon.save!
      @pokemons = Pokemon.order("ranking DESC").first(10)
      ActionCable.server.broadcast(
        "pokemons",
        render_to_string(partial: "pokemon", locals: { pokemons: @pokemons })
      )
      PokemonChannel.broadcast_to(
        @pokemon,
        render_to_string(partial: "pokemon_points", locals: { pokemon: @pokemon })
      )
      redirect_to root_path
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokemon_stats = "#{@pokemon.hp},#{@pokemon.speed},#{@pokemon.attack},#{@pokemon.defense},#{@pokemon.special_attack},#{@pokemon.special_defense}"

  end

end
