Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home", to: "homes#home"
  get "about", to: "homes#about"
  get "event", to: "events#event"
end
