Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :services do
    resources :reviews, only: [:index, :create]
  end
  root to: "services#index"
end
