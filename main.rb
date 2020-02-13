require_relative 'connection'
require_relative 'models/client'
Dir.glob("models/*").each { |file| require_relative file }

if false
  winter = Category.create(name: "winter", description: "cold")
  summer = Category.create(name: "summer", description: "hot")

  product = Product.new(name: "snowboard", price: 120.35, description: "OK")
  product.category = winter
  product.save
  product = Product.new(name: "ski", price: 17.25, description: "Broken")
  product.category = winter
  product.save

  client = Client.create(firstname: "Bob", lastname: "lennon")
end

if true
  Category.all.each { |category| puts "#{category} (#{category.name}), #{category.products.count} products" }
  Product.all.each { |product| puts "#{product} (#{product.category}, #{product.price})" }
  Client.all.each { |client| puts "#{client}" }
end