Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home", to: "homes#home"
  get "about", to: "homes#about"

  get "event", to: "events#event"
  get "detal/:id", to: "events#detal"
  post "coment", to: "events#detal" 

  get "singup", to: "users#new"
  patch "user/:id/update", to: "users#update"
  post "singup", to: "users#create"
  get "mypage", to: "users#mypage"
  get "user/:id/edit", to: "users#edit"
  
  get "login", to: "sessions#login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  post "post", to: "posts#create"
  get "post", to: "posts#show"
  
end
