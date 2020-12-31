# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :services do
    resources :reviews, only: %i[index create]
  end
  root to: 'services#index'
end
