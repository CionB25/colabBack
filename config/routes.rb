Rails.application.routes.draw do
  resources :user_requests
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, except: [:create]
      resources :logins
      resources :user_repos
      resources :repositories

      get 'login', to: "logins#create"
      post 'home', to: "users#create"
      post 'auth', to: 'auth#create'
      get 'current_user', to: "auth#show"
      get 'repositories', to:"repository#index"
      post 'request_repo', to: "requests#create"
      post 'my_requests', to: "requests#index"
      post 'send_invite', to: "requests#show"
    end
  end
end
