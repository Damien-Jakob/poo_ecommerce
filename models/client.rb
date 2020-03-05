class Client < ActiveRecord::Base
  has_many :orders
  # use relation :products of :orders
  has_many :ordered_products, through: :orders, source: :products
  # has_many :favorite_products

  validates :firstname,
            presence: true,
            length: {
                minimum: 2
            }

  validates :lastname,
            presence: true,
            length: {
                minimum: 2
            }

  def to_s
    "#{firstname} #{lastname}"
  end

  def products_but_bad
    # tons of db requests
    orders.map { |order| order.order_items.map { |item| item.product } }.flatten
  end
end
