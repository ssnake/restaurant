Rails.application.routes.draw do
  
  #get 'product_types/index'

  #get 'product_types/new'

  #get 'product_types/show'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  end
  
end
