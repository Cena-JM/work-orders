Rails.application.routes.draw do
  root to: 'assignments#index'
  resources :assignments, only: [:index, :new, :create, :destroy]
  resources :work_orders, only: [:index, :show, :new, :create, :destroy]
  resources :workers, only: [:index, :show, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
