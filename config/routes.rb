# frozen_string_literal: true

Rails.application.routes.draw do
  get 'page/show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :suppliers, only: :index
  resources :products, only: :index
  resources :page, only: :show

  root to: 'products#index'
end
