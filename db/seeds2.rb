require_relative '../models'

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
