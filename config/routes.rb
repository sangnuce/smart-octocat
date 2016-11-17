Rails.application.routes.draw do
  root "welcomes#index"

  post "webhooks" => "webhooks#index"
  post "deployhooks" => "deployhooks#index"
end
