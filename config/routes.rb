Rails.application.routes.draw do
  resources :teams, only: [:new, :create, :show, :edit, :destroy]
end
