Rails.application.routes.draw do
  root "sessions#home"

  resources :users, only: [:show, :edit, :update] do
    resources :posts, only: [:show, :edit, :create, :update]
    get "/posts/:id/like", to: "posts#post_like"
    post "/posts/:id/comment", to: "posts#post_comment", as: "comment"
  end

  # additional routes for UsersController
  get "/users/:id/lists", to: "users#lists"
  post "/users/:id/complete_list", to: "users#complete_list"
  get "/users/:id/clear_lists", to: "users#clear_lists"
  get "/users/:id/undo_list", to: "users#undo_lists"
  get "/users/:id/report", to: "users#report"

  resources :challenges
  # additional routes for ChallengesController
    get "/challenges/sort/:value", to: "challenges#sort"
    get "/challenges/:id/commit/:regularity", to: "challenges#commit"
    get "/challenges/:id/uncommit", to: "challenges#uncommit"
    

  resources :groups
  # additional routes for ChallengesController
  get "/groups/sort/:value", to: "groups#sort"
  get "/groups/:id/commit_all/:value", to: "groups#commit_all"
  get "/groups/:id/uncommit_all", to: "groups#uncommit_all"
  get "/groups/:id/sort_challenges", to: "groups#sort_challenges"
  get "/groups/:id/forum", to: "groups#forum"
  get "/groups/:id/group_challenges", to: "groups#group_challenges"
  post "/groups/:id/edit_challenges", to: "groups#edit_challenges"
  get "groups/:id/join", to: 'groups#join'
  get "/groups/:id/leave", to: "groups#leave"


  # routes for SessionsController
    get "/", to: "sessions#home"
    get "/signup", to: "sessions#signup"
    post "/signup", to: "sessions#manual_signup"
    post "/login", to: "sessions#manual_login"
    get '/auth/:provider/callback', to: 'sessions#create'
    get "/logout", to: "sessions#destroy"

end
