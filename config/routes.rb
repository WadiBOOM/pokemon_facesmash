# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: 'pokemons#index'

  # get "pokemons/:id", to: "pokemons#show"


  # post "pokemons/:id/update", to: "pokemons#update"

  resources :pokemons, only: [:show, :update]

  # resources :pokemons, only: [:show] do
  #   member do
  #     get :update
  #   end
  # end
end
