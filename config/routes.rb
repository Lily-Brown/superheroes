Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teams#index'

  resources :teams do
    resources :superheroes
  end

  get '/teams/:team_id/superheroes/:id', to: 'superheroes#show', as: 'team_superheros'

end
