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

# Test client validation
if false
  Client.create(firstname: "Bob", lastname: "Lennon")
  Client.create(firstname: "B", lastname: "Lennon")
  Client.create(firstname: "Bob", lastname: "L")
  Client.create(lastname: "Lennon")
  Client.create(firstname: "Bob")

  Client.all.each { |client| puts client }
end

# Test order creation
if true
  client = Client.last
  order = client.orders.new
  puts order.order_items.count
  puts order.valid?
  # Cannot create an order_item for order if order is not saved
  # But cannot save order if it has no order_item
  
  # order_item = order.order_items.create
  puts order.order_items.count
  puts order.valid?
end
