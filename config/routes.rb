Rails.application.routes.draw do
  root "welcomes#index"

  post "webhooks" => "webhooks#index"
  post "deployhooks" => "deployhooks#index"

  namespace :api do
  	resources :rooms
  end
end
