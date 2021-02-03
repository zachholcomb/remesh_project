Rails.application.routes.draw do
  root 'conversations#index'

  get '/conversations/search', to: 'conversations_search#index'
  resources :conversations, except: [:destroy, :edit, :update] do
    resources :messages, only: [:create, :show] do
      resources :thoughts, only: [:create]
    end
  end
end
