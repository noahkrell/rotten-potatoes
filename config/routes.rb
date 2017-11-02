Rails.application.routes.draw do
  root "movies#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  get '/movies' => "movies#index"
  get '/movies/:id' => "movies#show", as: "movie"

  get '/genres' => "genres#index"
  get '/genres/:id' => "genres#show", as: "genre"
end
