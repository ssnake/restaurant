class AddNameToGroupOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :group_orders, :group_name, :text
  end
end
