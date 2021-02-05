# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :blogs
  resources :categories
  resources :members
  get 'blogapp/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
