class CreateGroupOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :group_orders do |t|
      t.text :name
      t.text :email
      t.text :notice
      t.string :pay_type

      t.timestamps
    end
  end
end
