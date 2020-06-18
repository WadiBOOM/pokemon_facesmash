# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: 'pokemons#index'

  get "pokemons/:id", to: "pokemons#show", as: :show


  get "pokemons/:id/update", to: "pokemons#update", as: :update

  # resources :pokemons, only: [:show] do
  #   member do
  #     put :update
  #     get :show
  #   end
  # end
end
