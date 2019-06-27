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

  get '/alterando/status/order/:id/:status', to: 'orders#change_status_order', as: :change_status_order
  get '/pagar/order/:id/', to: 'orders#pay_order', as: :pay_order
  post '/criar/pagar/order/', to: 'orders#pay_order_create', as: :pay_order_create

  scope '/busca' do
    get '/endereco/:cep', to: 'home#find_by_address'
    get '/cidades/:id', to: 'home#find_city'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
