Rails.application.routes.draw do
  devise_for :users
  
  root 'profiles#show'
  resources :profiles
end
