class AddUserIdToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :user
  end
end
