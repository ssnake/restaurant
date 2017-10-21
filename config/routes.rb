Rails.application.routes.draw do
  
  devise_for :users
  # общая точка входа
  root to: 'product_types#index'
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end
  
end
