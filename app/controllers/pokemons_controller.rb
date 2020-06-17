class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
    @pokemons_to_rate = @pokemons.sample(2)
  end

  def update
    raise
    @pokemon = Pokemon.find(params[:id])
    @pokemon.ranking += 151
  end

  def update_ranking
    raise
    @pokemon = Pokemon.find(params[:id])
    @pokemon.ranking += 151
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

end
