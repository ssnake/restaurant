class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # подсчет стоимости всех позиций
  def total_price
  	product.price * quantity
  end

  # валидации количества
  validates :quantity, presence: {message: "введите количество!"}
  validates :quantity, numericality: { greater_than: 0.1, message: 'Значение стоимости должно быть целым числом, и больше ноля' }
  validates :quantity, numericality:  {only_integer: true}
end

