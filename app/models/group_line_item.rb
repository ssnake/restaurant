class GroupLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :group_cart
end
