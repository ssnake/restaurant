class ProductType < ApplicationRecord
  # создание связи один ко многим - имеет много :products
  has_many :products
end
