Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, except: [:create]
      resources :logins
      resources :user_repos
      resources :repositories

      get 'login', to: "logins#create"
      post 'home', to: "users#create"
    end
  end
end
