Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/show'

  get 'rooms/show'
end
