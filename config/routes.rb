Rails.application.routes.draw do
  root 'home#index'
  get 'home/show'

  get 'rooms/show'
end
