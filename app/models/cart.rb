class Cart < ApplicationRecord
  # настраиваем отслеживание корзины.
  # при удалении корзины удалить запись в связывающей таблице
  has_many :line_items, dependent: :destroy
end
