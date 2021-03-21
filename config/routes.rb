Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/new',       to: 'restaurants#new'
  get '/show',      to: 'restaurants#show'

  post '/show',     to: 'restaurants#show'
  # post '/search',   to: 'restaurants#search'
  post '/search',    to: 'restaurants#create'

  root 'restaurants#index'

  resource :restaurants
end