# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :settings
  resources :payments
  resources :orders
  resources :products
  resources :clients
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
