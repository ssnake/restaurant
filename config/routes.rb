Rails.application.routes.draw do
  
  root to: 'store#index'

  resources :members
  resources :joiners
  resources :groups
  resources :orders
  resources :store, only: [:index, :show]
  resources :line_items
  resources :carts

  devise_for :users
  # общая точка входа
  #root to: 'product_types#index'
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end



  
end
