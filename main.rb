require_relative 'connection'
require_relative 'models/client'
Dir.glob("models/*").each { |file| require_relative file }

# Testing that the seeders work correctly
if true
  Category.all.each { |category| puts "#{category} (#{category.name}), #{category.products.count} products" }
  Product.all.each { |product| puts "#{product} (#{product.category}, #{product.price})" }
  Client.all.each { |client| puts "#{client} (#{client.orders.count} orders)" }
  Order.all.each { |order| puts "#{order}" }
end