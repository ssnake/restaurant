class Product < ApplicationRecord
  # создание связи один ко многим - следовать за product_type
  belongs_to :product_type

  validates :title, presence: { message: 'Название не может быть пустым' }
  validates :title, length: { maximum: 30, message: 'Название не может быть длиннее 30 символов' }
  validates :description, length: { maximum: 255, message: 'Описание блюда должно быть не длиннее 255 символов' }
  validates :price, numericality: { message: 'Значение стоимости должно быть числом' }
#  validates :price, greater_than: { 0, message: 'Значение цены должно быть больше 0' }
end
