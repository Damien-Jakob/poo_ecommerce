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
if true
  client = Client.last
  order = client.orders.create
  Product.all.each { |product| order.order_items.create(product: product, quantity: 101) }
end