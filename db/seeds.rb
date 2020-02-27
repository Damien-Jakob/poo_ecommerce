# rake db:seed

require_relative '../models/category'
require_relative '../models/product'
require_relative '../models/client'
require_relative '../models/order'
require_relative '../models/order_item'

if false
  winter = Category.create(name: "winter", description: "cold")
  summer = Category.create(name: "summer", description: "hot")

  Product.create(name: "snowboard", price: 120.35, description: "OK", category: winter)
  Product.create(name: "ski", price: 17.25, description: "Broken", category: winter)

  Client.create(firstname: "Bob", lastname: "Lennon")
end

# Seeder order
if false
  client = Client.last
  order = client.orders.create
  Product.all.each { |product| order.order_items.create(product: product, quantity: 101) }
end

# Hurni Seeder
if true
  Client.new(firstname: "Pascal", lastname: "Hurni").save
  xavier = Client.create(firstname: "Xavier", lastname: "Carrel")

  sport = Category.create(name: "Sport", description: "Pour les fous")

  ski = Product.create(name: "Ski de piste", price: 123.50, category: sport)
  batons = Product.create(name: "Batons de ski", price: 9.50, category: sport)

  # Soit comme ça
  #order = Order.create(client: xavier, status: "created")
  # Ou bien comme ça
  order = xavier.orders.create

  order.order_items.create(product: ski, quantity: 1, item_price: ski.price)
  order.order_items.create(product: batons, quantity: 3, item_price: batons.price)
end