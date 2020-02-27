require_relative 'connection'
Dir.glob("models/*").each { |file| require_relative file }

# Testing that the seeders work correctly
if false
  Category.all.each { |category| puts "#{category} (#{category.name}), #{category.products.count} products" }
  Product.all.each { |product| puts "#{product} (#{product.category}, #{product.price})" }
  Client.all.each { |client| puts "#{client} (#{client.orders.count} orders)" }
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

client = Client.last
puts client