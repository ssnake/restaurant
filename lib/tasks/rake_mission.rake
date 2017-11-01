task :hello do 
  puts 'Hello world'	
end

task :get_menu do
  products = Product.all
  products.each do |product|
  	puts '#{product}'
  end
end
