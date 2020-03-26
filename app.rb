class Shops
  attr_accessor :id
  attr_accessor :products
  attr_accessor :stock
  def initialize
    @id = rand(5000)
    @products = Array.new
    
  end

  def add_product(name,price,stock =1)
    @products.push({"name"=>name, "price"=> price, "stock"=> stock})

  end

  def sale(percentage)
    @products.each do |product|
      product["price"] = product["price"] * (percentage.to_f/100)
    end
  end

  def stock
    @products.each do |product|
      puts "Product Name: #{product['name']} || Stock: #{product['stock']}"
    end
  end
end

prod = Shops.new
p 'pleas write product name'
pr_name = gets.chomp
p 'pleas write product price'
pr_price = gets.chomp.to_i

p 'how many do you want to add'
pr_stock =  gets.chomp.to_i
prod.add_product(pr_name,pr_price,pr_stock)
puts '================ OLD =============='
puts prod.products
p 'pleas write the sale percentage for all product'
pr_sale = gets.chomp.to_i
prod.sale(pr_sale)

puts '================ NEW =============='
puts prod.products
puts prod.stock