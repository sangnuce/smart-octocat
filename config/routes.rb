Rails.application.routes.draw do
  root "react_app#home"

  post "webhooks" => "webhooks#index"
  post "deployhooks" => "deployhooks#index"

  namespace :api do
  	resources :rooms
  end
  get "*path", to: "react_app#home"
end
