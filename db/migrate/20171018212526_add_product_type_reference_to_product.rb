class AddProductTypeReferenceToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :product_type, foreign_key: true
  end
end
