class Order < ApplicationRecord
  # определяем массив видов оплаты
  PAYMENT_TYPES = ["наличными", "кредитной картой"]

  has_many :line_items, dependent: :destroy

  # определяем валидации
  validates :name, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :notice, 
  			length: { maximum: 255, message: 'Комментари к заказу не должны быть длиннее 255 символов' }

  def set_order_attr(user)
  	self.name = user.name
  	self.email = user.email
  end

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  	  item.cart_id = nil
  	  line_items << item
  	end
  end

end
