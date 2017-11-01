class AddGroupToGroupOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_orders, :group 
  end
end
