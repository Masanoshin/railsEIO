Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home", to: "homes#home"
  get "about", to: "homes#about"
  get "event", to: "events#event"
  get "singup", to: "users#new"
  post "singup", to: "users#create"
  get "login", to: "sessions#login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "mypage", to: "users#mypage"
  post "post", to: "posts#create"
  get "post", to: "posts#show"
  get "users/:id/edit", to: "users#edit"
end
