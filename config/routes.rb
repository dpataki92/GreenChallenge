Rails.application.routes.draw do
  root "sessions#home"

  resources :users, only: [:show, :edit, :update]
  # additional routes for UsersController
  get "/users/:id/lists", to: "users#lists"

  resources :challenges
  # additional routes for ChallengesController
    get "/challenges/sort/:value", to: "challenges#sort"
    get "/challenges/:id/commit/:regularity", to: "challenges#commit"
    get "/challenges/:id/uncommit", to: "challenges#uncommit"
    

  resources :groups
  # additional routes for ChallengesController
  get "/groups/sort/:value", to: "groups#sort"
  get "/groups/:id/commit_all/:value", to: "groups#commit_all"
  get "groups/:id/sort_challenges", to: "groups#sort_challenges"
  get "groups/:id/forum", to: "groups#forum"
  get "groups/:id/group_challenges", to: "groups#group_challenges"
  post "groups/:id/add_challenges", to: "groups#add_challenges"


  # routes for SessionsController
    get "/", to: "sessions#home"
    get "/signup", to: "sessions#signup_page"
    post "/signup", to: "sessions#manual_signup"
    post "/login", to: "sessions#manual_login"
    get '/auth/:provider/callback', to: 'sessions#create'
    get "/logout", to: "sessions#destroy"

end
