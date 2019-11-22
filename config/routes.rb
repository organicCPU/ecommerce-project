# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :suppliers, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

  post '/products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete '/products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  get ':permalink', to: 'pages#permalink', as: 'pages'

  root to: 'products#index'
end
