class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # подсчет стоимости всех позиций
  def total_price
  	product.price * quantity
  end
end
