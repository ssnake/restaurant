class AddUserToGroupLineItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_line_items, :user
  end
end
