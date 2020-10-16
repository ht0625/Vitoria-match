Rails.application.routes.draw do
  resources :teams, only: [:new, :create, :edit, :destroy]
end
