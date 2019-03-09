Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :teams, only: [:show, :index, :create, :update] do
        resources :users, only: [:show, :create, :update]
        resources :messages, only: [:index, :create]
        resources :channels
        post '/login', to: 'auth#create'
        get '/current_user', to: 'auth#show'
        post '/update_last_seen', to: 'users#update_last_seen'
        get '/user_data', to: 'users#show'
        patch '/user_data', to: 'users#update'
      end
    end
  end
end
