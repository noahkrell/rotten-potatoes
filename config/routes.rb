# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         movies#index
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout DELETE /logout(.:format)         sessions#destroy
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#    movies GET    /movies(.:format)         movies#index
#     movie GET    /movies/:id(.:format)     movies#show
#

Rails.application.routes.draw do
  root "movies#index"


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  get '/movies' => "movies#index"
  get '/movies/:id' => "movies#show", as: "movie"

end
