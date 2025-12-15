Rails.application.routes.draw do
  resources :portfolios
  # Define routes first so they take precedence
  get "cryptos/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"
  get "home/about"
  root "home#index"
  # User routes
  resources :users
  
  # authentication routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # registration routes
  get "register", to: "users#new"
  # Create route for cryptocurrencies index
  get "cryptos", to: "cryptos#index"
  # About page route (not sure if I will add about page) but I'll keep it for now
  get "about", to: "about#home"
end
