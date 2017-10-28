class GroupLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :group_cart

  # подсчет стоимости всех позиций
  def total_price
  	product.price * quantity
  end
  
end
