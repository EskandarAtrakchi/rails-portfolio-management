Rails.application.routes.draw do
  resources :portfolios
  get "cryptos/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"
  get "home/about"
  root "home#index"
  
  resources :users
  
  # authentication routes (to be created)
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "register", to: "users#new"
  get "cryptos", to: "cryptos#index"
  get "about", to: "about#home"
end
