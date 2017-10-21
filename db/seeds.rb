# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductType.create!(title: 'Первые блюда')
  Product.create!(title: 'Суп', description: 'из семи круп', price: 8, product_type_id: 1)
  Product.create!(title: 'Борщ', description: 'с буряком и сметаной', price: 10, product_type_id: 1)
  Product.create!(title: 'Уха', description: 'из карасей', price: 10, product_type_id: 1)
  Product.create!(title: 'Шурпа', description: 'с мясом', price: 12, product_type_id: 1)
ProductType.create!(title: 'Вторые блюда')
  Product.create!(title: 'Картошка', description: 'с мясом', price: 10, product_type_id: 2)
  Product.create!(title: 'Шашлык', description: 'из свинины', price: 16, product_type_id: 2)
  Product.create!(title: 'Гречка', description: 'с соусом', price: 6, product_type_id: 2)
ProductType.create!(title: 'Десерты')
  Product.create!(title: 'Яблочный пирог', description: 'в нем правда есть яблоки', price: 6, product_type_id: 3)
  Product.create!(title: 'Пирог с абрикосами', description: 'абрикосы с косточками', price: 5.75, product_type_id: 3)
ProductType.create!(title: 'Напитки')  
  Product.create!(title: 'Чай', description: 'в пакетиках', price: 4, product_type_id: 4)
  Product.create!(title: 'Кофе', description: 'Американо', price: 6.55, product_type_id: 4)
  Product.create!(title: 'Кофе', description: 'заварной', price: 10, product_type_id: 4)

User.create!(name: 'admin', email: 'admin@gmail.com', password: 'password', 
  password_confirmation: 'password', admin: true)


