Rails.application.routes.draw do
  
  # общая точка входа
  root to: 'product_types#index'
  get '/' => 'product_types#index'

  # в ресурсе :product_types вводим вложенный ресурс :products
  resources :product_types do
  	resources :products
  	# перенапрявляем маршрут к перечню по категориям
  	#get '/product_types/:product_type_id/products' => '/product_types/:id'
  end
  
end
