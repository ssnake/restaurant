class AddOrderToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :order
  end
end
