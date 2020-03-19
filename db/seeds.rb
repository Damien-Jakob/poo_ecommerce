# rake db:seed

require_relative '../models/category'
require_relative '../models/product'
require_relative '../models/supplier'
require_relative '../models/individualClient'
require_relative '../models/order'
require_relative '../models/order_item'

if true
  # categories
  winter = Category.create(name: "winter", description: "cold")
  summer = Category.create(name: "summer", description: "hot")
  sport = Category.create(name: "Sport", description: "Pour les fous")

  # clients
  bob = IndividualClient.create(firstname: "Bob", lastname: "Lennon")
  pascal = IndividualClient.create(firstname: "Pascal", lastname: "Hurni")
  xavier = IndividualClient.create(firstname: "Xavier", lastname: "Carrel")

  # suppliers
  supplier = Supplier.create(name: "THE supplier")

  # products
  snow = Product.create(
      name: "snowboard", price: 120.35, stock: 145, description: "OK", category: sport, supplier: supplier
  )
  ski = Product.create(
      name: "Ski de piste", price: 123.50, stock: 5, category: sport, supplier: supplier
  )
  batons = Product.create(
      name: "Batons de ski", price: 9.50, stock: 10, category: sport, supplier: supplier
  )

  # order + order_item
  order = bob.orders.new
  order.order_items.new(product: ski, quantity: 1)
  order.order_items.new(product: batons, quantity: 3)
  order.save
  order = pascal.orders.new
  order.order_items.new(product: snow, quantity: 100)
  order.order_items.new(product: batons, quantity: 2)
  order.save

end