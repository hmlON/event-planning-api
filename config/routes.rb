Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :messages
  end
  resources :invites
  get '/feed' => 'activities#index'
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
end
