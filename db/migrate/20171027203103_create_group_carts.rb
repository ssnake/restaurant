class CreateGroupCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :group_carts do |t|
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
