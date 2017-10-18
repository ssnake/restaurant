class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string 	:title
      t.text 	:description
      t.decimal :price, precision:8, scale:2
      t.string	:type	# type of product (first dish, dessetr...)	

      t.timestamps
    end
  end
end
