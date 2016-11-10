Rails.application.routes.draw do
  post "webhooks" => "webhooks#index"
end
