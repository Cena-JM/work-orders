# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'assignments#index'
  resources :assignments, only: %i[index new create]
  resources :work_orders, only: %i[index show new create]
  resources :workers, only: %i[index show new create] do
    resources :work_orders, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
