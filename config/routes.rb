Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :runs, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      # Message routes 
      get '/users/:user_id/messages', to: 'messages#index' #all of users messages in and out 
      get '/users/:user_id/inbox', to: 'messages#inbox' #all of users recived messages
      get '/users/:user_id/outbox', to: 'messages#outbox' #all of users recived messages
      get '/users/:user_id/messages/:message_id', to: 'messages#show_msg_conversation' #all of users recived messages
      post '/users/:user_id/messages/:message_id', to: 'messages#reply_to_message' #all of users recived messages
      post '/users/:user_id/messages', to: 'messages#start_message_conv' #start a new converstation 


      get '/users/:user_id/find_runner', to: 'users#match_users'
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

      # hiking response
      get "/users/:user_id/random_trail", to: "hiking#show" 

      # scope module: 'users' do
      #   get "/runs", to: "user_runs#index"
      # end
      # namespace :users do
      #   resources :runs, only: [:index]
      # end
    end
  end
end
