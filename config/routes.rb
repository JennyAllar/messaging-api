Rails.application.routes.draw do
  resources :users
  resources :conversations, only: [:create, :show] do
    resources :messages, only: [:create, :index]
  end

  get '*path', to: 'application#routing_error'
end
