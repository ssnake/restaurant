class ProductType < ApplicationRecord
  # создание связи один ко многим - имеет много :products
  has_many :products

  # название категории меню должно быть, и не длиннее 50 знаков
  validates :title, presence: true, length: {maximum: 50}
end
