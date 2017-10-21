class CombineItemsInCart < ActiveRecord::Migration[5.1]
  
  # замена нескольких дублирующихся записей блюда на одну записть
  # с правильным количеством блюд
  def up

  	Cart.all.each do |cart|
  	  # подсчет кол-ва каждого из блюд в корзине
  	  sums = cart.line_items.group(:product_id).sum(:quantity)
  	  # удаление отдельных записей если сумма больше 1
  	  sums.each do |product_id, quantity|
  	  
  	    if quantity > 1
          cart.line_items.where(product_id: product_id).delete_all
          # замена одной записью
          item = cart.line_items.build(product_id: product_id) 
          item.quantity = quantity
          item.save!
        end
      end
    end
  
  end


  # разбиение записи с quantity > 1 на несколько записей и запись их в таблицу
  def down

  	LineItem.where("quantity>1").each do |line_item|
  	  # записываем отдельные строки
  	  line_item.quantity.times do
  	  	LineItem.create cart_id: line_item.cart_id, 
  	  	product_id: line_item.product_id, quantity: 1
  	  end
  	  # удаление исходной записи
      line_item.destroy
    end

  end

end
