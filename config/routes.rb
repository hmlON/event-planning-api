Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  root 'events#index'
  resources :events
  devise_for :users
end
