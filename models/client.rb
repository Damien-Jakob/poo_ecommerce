class Client < ActiveRecord::Base
  has_many :orders
  # use relation :products of :orders
  has_many :ordered_products, through: :orders, source: :products
  # has_many :favorite_products

  # TODO find cleaner solution ?
  scope :orderless, -> { where('id NOT IN (SELECT client_id FROM orders)') }

  def products_but_bad
    # tons of db requests
    orders.map { |order| order.order_items.map { |item| item.product } }.flatten
  end
end
