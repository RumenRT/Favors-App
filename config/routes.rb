Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/destroy'

  get 'favorbrowsers', to: 'favor_browser#index'

  devise_for :users
  
  root 'profiles#index'
  resources :profiles 
  resources :favors 

  post '/favors/create', to: "favors#create"

  
end
