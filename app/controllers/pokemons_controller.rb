class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def update
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

end
