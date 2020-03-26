class Client < ActiveRecord::Base
  has_many :orders
  # use relation :products of :orders
  has_many :ordered_products, through: :orders, source: :products
  # has_many :favorite_products

  # Ex 2-3
  # scope :orderless, -> { where.not(id: Order.select(:client_id).distinct) }
  # scope :orderless, -> { left_joins(:orders).where(orders: {id: nil}) }
  scope :orderless, -> { where.not(id: joins(:orders)) }

  # never do that
  def products_but_bad
    # tons of db requests
    orders.map { |order| order.order_items.map { |item| item.product } }.flatten
  end
end
