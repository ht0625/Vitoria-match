Rails.application.routes.draw do
  devise_for :users
  resources :teams, only: [:new, :create, :show, :edit, :update, :destroy]
  root 'teams#new'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
