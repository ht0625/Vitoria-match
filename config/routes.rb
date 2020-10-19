Rails.application.routes.draw do
  get 'users/show'
  resources :invites
  devise_for :users
  resources :users, only: [:show]
  resources :teams, only: [:new, :create, :show, :edit, :update, :destroy]
  root 'teams#new'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
