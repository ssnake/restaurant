class GroupOrder < ApplicationRecord
  
  has_many :group_line_items, dependent: :destroy
  has_one :group
  # определяем массив видов оплаты
  PAYMENT_TYPES = ["наличными", "кредитной картой"]

  # определяем валидации
  validates :name, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :notice, 
  			length: { maximum: 255, message: 'Комментари к заказу не должны быть длиннее 255 символов' }

  def set_order_attr(group)
  	self.name = group.user.name
  	self.email = group.user.email
    self.group_name = group.name
  end

  def set_price(group_cart)
  	item = GroupLineItem.where(group_cart_id: group_cart.id)
  	total = 0
  	item.each do |i|
  	  total += (i.product.price * i.quantity)
  	end
  	self.price = total
  end

end
