# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :settings
  resources :payments
  resources :orders
  resources :products
  resources :clients
  resources :users

  scope '/busca' do
    get '/endereco/:cep', to: 'home#find_by_address'
    get '/cidades/:id', to: 'home#find_city'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
