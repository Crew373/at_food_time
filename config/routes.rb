Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/show',        to: 'restaurants#show'
  get '/top',         to: 'restaurants#top'

  post '/search',     to: 'locations#create'
  post '/store_info', to: 'restaurants#create'

  root 'restaurants#index'

  resource :restaurants
  resource :locations
end