Rails.application.routes.draw do
  root 'events#index'
  resources :events
  devise_for :users
end
