Rails.application.routes.draw do
  resources :categories
  resources :tasks do
    collection do
      get :delete_all, :delete_completed
    end
  end
  # get "chatroom", to: "chatroom#index"
  # resources :messages, only: [:create, :destroy]
  root "pages#home"
  get "about", to: "pages#about"
  resources :users, except: [:new]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  mount ActionCable.server, at: "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
