Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :services
  root to: "services#index"
  
end
