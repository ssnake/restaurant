class AddGroupOrderToGroupLineItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_line_items, :group_order, foreign_key: true
  end
end
