Rails.application.routes.draw do
  root "sessions#home"

  resources :users, only: [:show, :edit, :update]

  resources :challenges
  # additional routes for ChallengesController
    get "/challenges/sort/:value", to: "challenges#sort"
    get "/challenges/:id/commit/:regularity", to: "challenges#commit"
    get "/challenges/:id/uncommit", to: "challenges#uncommit"
  # routes for SessionsController
    get "/", to: "sessions#home"
    get "/signup", to: "sessions#signup_page"
    post "/signup", to: "sessions#manual_signup"
    post "/login", to: "sessions#manual_login"
    get '/auth/:provider/callback', to: 'sessions#create'
    get "/logout", to: "sessions#destroy"

end
