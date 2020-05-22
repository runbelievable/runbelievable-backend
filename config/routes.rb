Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :runs, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      get '/users/:user_id/runs', to: 'user_runs#index'
      # scope module: 'users' do
      #   get "/runs", to: "user_runs#index"
      # end
      # namespace :users do
      #   resources :runs, only: [:index]
      # end
    end
  end

end
