class GroupLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :group_cart, dependent: :destroy

  # подсчет стоимости всех позиций
  def total_price
  	product.price * quantity
  end
  
end
