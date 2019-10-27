Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/key', to: 'key#show'
      post '/users', to: 'users#create'
      get '/users', to: 'sessions#create'
      get '/users/:user_id/trips/:id', to: 'trips#stops'
      post '/users/:user_id/trips', to: 'trips#create'
      # get '/users/:user_id/trips/:id', to: 'trips#stops'
    end
  end
end
