Rails.application.routes.draw do
  root "welcome#show"

  resources :places, only: [:show]
end
