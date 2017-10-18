class Product < ApplicationRecord
  # создание связи один ко многим - следовать за product_type
  belongs_to :product_type
end
