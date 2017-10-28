class CombineItemsInGroupCart < ActiveRecord::Migration[5.1]

  # замена нескольких дублирующихся записей блюда на одну записть
  # с правильным количеством блюд	
  def up
  	GroupCart.all.each do |group_cart|
  	  # подсчет кол-ва каждого из блюд в корзине
  	  sums = group_cart.group_line_items.group(:product_id).sum(:quantity)
  	  # удаление отдельных записей если сумма больше 1
  	  sums.each do |product_id, quantity|
  	    if quantity > 1
          group_cart.group_line_items.where(product_id: product_id).delete_all
    	  # замена одной записью
  	      item = group_cart.group_line_items.build(product_id: product_id)
  	      item.quantity = quantity
  	      item.save!
  	    end
  	  end
  	end
  end

  
  # разбиение записи с quantity > 1 на несколько записей и запись их в таблицу
  def down
  	GroupLineItem.where("quantity>1").each do |group_line_item|
      # записываем отдельные строки
      group_line_item.quantity.times do
      	GroupLineItem.create group_cart_id: group_line_item.group_cart_id,
  	    product_id: group_line_item.product_id, quantity: 1
  	  end
  	  # удаление исходной записи
  	  group_line_item.destroy
  	end
  end

end
