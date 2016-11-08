Rails.application.routes.draw do
  root 'conversations#index'
  devise_for :users

  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:create, :new]
  resources :users, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
