Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  
  root 'profiles#index'
  resources :profiles 
  resources :favors 

  post '/favors/create', to: "favors#create"

  
end
