Rails.application.routes.draw do
  resources :conversations, only: [:index, :show]
end
