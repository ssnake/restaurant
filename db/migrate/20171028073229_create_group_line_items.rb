class CreateGroupLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :group_line_items do |t|
      t.references :product, foreign_key: true
      t.belongs_to :group_cart, foreign_key: true

      t.timestamps
    end
  end
end
