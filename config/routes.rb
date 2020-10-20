Rails.application.routes.draw do
  get 'users/show'
  root 'invites#index'
  devise_for :users
  resources :users, only: [:show]
  resources :invites
  resources :teams, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :conversations do
    resources :messages
  end  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
