Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/users', to: 'sessions#create'
      get '/users/:user_id/trips', to: 'trips#radii'
      post '/users/:user_id/trips', to: 'trips#create'
    end
  end
end
