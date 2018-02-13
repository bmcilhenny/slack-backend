Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :teams, only: [:show, :index, :create, :update] do
        resources :users
        resources :messages
        resources :channels
        post '/login', to: 'auth#create'
        get 'current_user', to: 'auth#show'
        post 'update_last_seen', to: 'users#update_last_seen'
      end
    end
  end
end
