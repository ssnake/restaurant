Rails.application.routes.draw do
  

  resources :group_line_items
  root to: 'store#index'

  #resources :group_store, only: [:index, :show]
  resources :members
  resources :joiners
  resources :groups
  resources :orders
  resources :store, only: [:index, :show]
  resources :line_items
  resources :carts

  scope '/group/:group_id' do
    resources :group_store, only: [:index, :show]
  end

  devise_for :users
  # общая точка входа
  #root to: 'product_types#index'
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end

 
end
