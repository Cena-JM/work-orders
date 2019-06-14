Rails.application.routes.draw do
  # root to: 'assignments#index'
  resources :assignments, only: [:index, :new, :create]
  resources :work_orders, only: [:new, :create]
  resources :workers, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
