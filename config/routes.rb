Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/key', to: 'key#show'
      post '/users', to: 'users#create'
      post '/user_login', to: 'sessions#create'
      post '/users/:user_id/trips', to: 'trips#create'
    end
  end
end
