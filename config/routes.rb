Rails.application.routes.draw do
  root "welcome#show"

  resources :locations, only: [:show]

  resources :companies, only: [:index, :show]
end
