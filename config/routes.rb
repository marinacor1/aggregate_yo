Rails.application.routes.draw do
  root "welcome#show"

  resources :locations, only: [:show]
end
