Rails.application.routes.draw do
  devise_for :users
  root "react_app#home"

  post "webhooks" => "webhooks#index"
  post "deployhooks" => "deployhooks#index"

  namespace :api do
    resources :rooms
    post "sessions" => "sessions#create"
  end
  get "*path", to: "react_app#home"
end
