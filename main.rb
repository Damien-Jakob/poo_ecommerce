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
if false
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

# Ex 6
# Test IndividualClient
if false
  puts IndividualClient.new(firstname: "Bob", lastname: "Lennon").valid?
  puts IndividualClient.new(firstname: "B", lastname: "Lennon").valid?
  puts IndividualClient.new(firstname: "Bob", lastname: "L").valid?
  puts IndividualClient.new(lastname: "Lennon").valid?
  puts IndividualClient.new(firstname: "Bob").valid?

  individual_client = IndividualClient.create(firstname: "Bob", lastname: "Lennon")
  puts individual_client
end

# Test EnterpriseClient
if false
  puts CompanyClient.new(name: 'a').valid?
  puts CompanyClient.new(name: 'AngulaGo').valid?

  company_client = CompanyClient.create(name: 'AngulaGo')
  puts company_client
end

# Test polymorphism
if false
  puts Client.all
end

# Ex 7
if false
  supplier = Supplier.last
  product1 = supplier.products.new(name: "Pantalons", price: 43.35, description: "Ne les perd pas.")
  product1.category = Category.find_by name: 'Habits'
  product2 = supplier.products.new(name: "Echelle", price: 82.50, description: "Attention : fragile")
  product2.category = Category.find_by name:'Bricolage'

  supplier.save

  puts supplier
  puts supplier.products
  puts supplier.categories
  puts supplier.categories.count
end

# Ex 8
if false
  product = Product.last
  product.comments << Comment.new(content: "Génial")
  product.comments << Comment.new(content: "NUL")
  product.save
  puts product.comments

  supplier = Supplier.last
  supplier.comments << Comment.new(content: "Click here to meet hot girls in your region.")
  supplier.comments << Comment.new(content: "The cake is a lie")
  supplier.save
  puts supplier.comments
end

# Ex 9
if true
  product = Product.new(
      name: "Hot Dog",
      price: 1.55,
      stock: 6,
      category: Category.last,
      supplier: Supplier.last,
      )
  product.save
  puts product.errors.full_messages

  ActiveRecord::Base.observers << :product_observer
  ActiveRecord::Base.instantiate_observers

  product.stock = 4
  product.save

end