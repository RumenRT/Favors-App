Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/destroy'

  get 'favorbrowsers', to: 'favor_browser#index'

  devise_for :users
  
  root 'favors#index'
  resources :profiles 
  resources :favors do
    get :claim
  end

  post '/favors/create', to: "favors#create"

  post '/profiles/check_box_completed' => 'profiles#check_box_completed',  as: 'checkbox'
  
end
