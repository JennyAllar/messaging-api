Rails.application.routes.draw do
  resources :users
  resources :messages

  get '*path', to: 'application#routing_error'
end
