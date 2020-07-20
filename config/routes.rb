Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :users
  get 'users/:id/messages', to: 'users#messages'

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:create, :index]
  end

  get '*path', to: 'application#routing_error'
end
