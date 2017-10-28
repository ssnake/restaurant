class AddProceToGroupOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :group_orders, :price, :decimal
  end
end
