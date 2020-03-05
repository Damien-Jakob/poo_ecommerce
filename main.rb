require_relative 'connection'
Dir.glob("models/*").each { |file| require_relative file }

# Testing that the seeders work correctly
if false
  Category.includes(:products).all.each { |category| puts "#{category} (#{category.name}), #{category.products.count} products" }
  Product.includes(:category).all.each { |product| puts "#{product} (#{product.category}, #{product.price})" }
  Client.includes(:orders).all.each { |client| puts "#{client} (#{client.orders.count} orders)" }
  Order.all.each { |order| puts "#{order}" }
end

# Test Product cheap scope
if false
  Product.cheap.each { |product| puts "#{product} (#{product.category}, #{product.price})" }
end

# Test OrderItem bulk scope
if false
  OrderItem.bulk.each { |order_item| puts "#{order_item.product}" }
end

# Exercise 3
if false
  client = Client.find_by firstname: 'Xavier', lastname: 'Carrel'
  puts "Produits pas cher commandés par #{ client } : "
  client.ordered_products.cheap(20.00).distinct.each { |product| puts "#{product} (#{product.category}, #{product.price})" }

  bulk_limit = 2
  puts "Produits commandés #{bulk_limit}+ fois : "
  OrderItem.includes(:product).bulk(bulk_limit).group(:product_id).each do |order_item|
    puts "#{ order_item.product} (#{ order_item.product.id})"
  end
  OrderItem.bulk(bulk_limit).map(&:product).each { |product| puts "#{product} (#{product.id})" }
end

# Exercise 4

# Test client validation
if false
  puts Client.new(firstname: "Bob", lastname: "Lennon").valid?
  puts Client.new(firstname: "B", lastname: "Lennon").valid?
  puts Client.new(firstname: "Bob", lastname: "L").valid?
  puts Client.new(lastname: "Lennon").valid?
  puts Client.new(firstname: "Bob").valid?

  # Client.all.each { |client| puts client }
end

# Test order creation
if false
  client = Client.last
  order = client.orders.new
  puts "items count : #{order.order_items.count}"
  puts "items size : #{order.order_items.size}"
  puts "valid? : #{order.valid?}"

  order.order_items.new(quantity: 1, product: Product.first)
  puts "added an order_item"
  puts "items count : #{order.order_items.count}"
  puts "items size : #{order.order_items.size}"
  puts "valid? : #{order.valid?}"
end

# Ex 5
if true
  client = Client.last
  order = client.orders.new
  order.order_items.new(quantity: 1, product: Product.first)
  order_item = order.order_items.new(quantity: 5, product: Product.last)
  # before_validation, but not before_save
  puts order_item.valid?
  puts order.save
  puts order.total_price

  puts order.order_items.new(quantity: 1, product: Product.first, item_price: 2).valid?
end
