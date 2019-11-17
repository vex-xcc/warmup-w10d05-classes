class Shop
  attr_accessor :name, :id

  def initialize(name)
    @name = name
    @id = ("A".."Z").to_a.sample + (0..9).to_a.sample(3).join
    @products = []
  end

  def add_product(name, price, stock = 1)
    if @products.select { |product| product[:name] == name }.empty?
      @products.push({ name: name, price: price, stock: stock })
    else
      @products.select { |product| product[:name] == name }[0][:stock] += stock
    end
  end

  def sale(percentage)
    puts "Hooray! We have a #{percentage}% sale!"
    @products.each do |product|
      product[:price] = (product[:price] * percentage) / 100
      puts "#{product[:name]} is now #{product[:price]}"
    end
  end

  def stock(name)
    puts "#{name} has #{@products.select { |product| product[:name] == name }[0][:stock]} in stock"
  end

  

  

  def purchase(name, stock = 1)
    @products.each do |pro|
      if pro[:name] == name
        if  pro[:stock] >= stock
          pro[:stock] -= stock
          puts "#{pro[:name]} purchased! \nNew stock is now #{pro[:stock]}"
        else
          puts "Sorry we're out of stock"
        end
      end
    end
  end

  def remove_product(name)
    @products.each.with_index do |pro, i|
      if pro[:name] == name
        @products.delete_at(i)
      end
    end
  end

  def show_products
    puts "Our Products:"
    puts "-------"
    @products.each do |pro|
      puts "Name: #{pro[:name]} \nPrice: #{pro[:price]} \nStock: #{pro[:stock]}."
      puts "-------"
    end
  end
end

shop = Shop.new("Supermarket")
shop.add_product("Apples", 10, 5)
shop.add_product("Bananas", 6, 2)
shop.add_product("Apples", 10)
shop.show_products
shop.sale(50)
shop.purchase("Bananas")
shop.stock("Bananas")
shop.remove_product("Bananas")
shop.show_products
p shop.id
p shop.name

