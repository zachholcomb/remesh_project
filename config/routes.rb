Rails.application.routes.draw do
  resources :conversations, except: [:delete, :update]
end
