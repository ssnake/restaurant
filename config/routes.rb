Rails.application.routes.draw do
  
  resources :orders
  root to: 'store#index'

  resources :store, only: [:index, :show]
  get 'store/show'

  devise_for :users
  # общая точка входа
  #root to: 'product_types#index'
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end

  resources :line_items
  resources :carts

  
end
