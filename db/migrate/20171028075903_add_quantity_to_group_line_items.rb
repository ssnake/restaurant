class AddQuantityToGroupLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :group_line_items, :quantity, :integer, default: 1
  end
end
