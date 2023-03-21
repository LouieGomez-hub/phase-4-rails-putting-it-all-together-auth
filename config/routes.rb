Rails.application.routes.draw do
  resources :recipes
  resources :users
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
end
