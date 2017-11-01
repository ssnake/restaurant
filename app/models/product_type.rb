class ProductType < ApplicationRecord
  # создание связи один ко многим - имеет много :products
  has_many :products, dependent: :destroy

  # название категории меню должно быть, и не длиннее 50 знаков
  validates :title, presence: { message: 'Поле не может быть пустым' }
  validates :title, length: {maximum: 30, message: 'Название не может быть длиннее 30 символов'}

  #def self.to_csv(options = {})
  #  CSV.generate(options) do |csv|
  #    csv << column_names
  #    all.each do |product|
  #      csv << product.attributes.values
  #    end
  #  end
  #end
end


