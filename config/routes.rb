Rails.application.routes.draw do
  resources :invites
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  root 'events#index'
  resources :events
  devise_for :users
end
