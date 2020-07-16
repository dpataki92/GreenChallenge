Rails.application.routes.draw do
  root "sessions#home"

  resources :users, only: [:index, :new, :create, :destroy]

  # routes for SessionsController
    get "/", to: "sessions#home"
    get "/signup", to: "sessions#signup_page"
    post "/signup", to: "sessions#manual_signup"
    post "/login", to: "sessions#manual_login"
    get '/auth/:provider/callback', to: 'sessions#create'
end
