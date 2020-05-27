Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :runs, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      get '/users/:user_id/runs', to: 'user_runs#index'
      get '/users/:user_id/runs/:run_id', to: 'user_runs#show'
      delete '/users/:user_id/runs/:run_id', to: 'user_runs#destroy'
      put '/users/:user_id/runs/:run_id', to: 'user_runs#update'
      post '/users/:user_id/runs', to: 'user_runs#create'

      get "/runs/:run_id/users", to: 'run_users#index'
      get "/runs/:run_id/users/:user_id", to: 'run_users#show'
      delete "/runs/:run_id/users/:user_id", to: 'run_users#destroy'
      put "/runs/:run_id/users/:user_id", to: 'run_users#update'
      post "/runs/:run_id/users", to: 'run_users#create'

      get "/login", to: "sessions#new"
      post "/login", to: "sessions#login"
      get '/logout', to: 'sessions#logout'

      # scope module: 'users' do
      #   get "/runs", to: "user_runs#index"
      # end
      # namespace :users do
      #   resources :runs, only: [:index]
      # end
    end
  end
end
