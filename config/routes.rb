Rails.application.routes.draw do
  
  # общая точка входа
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end
  
end
