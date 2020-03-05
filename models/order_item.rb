class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 1,
            }
  validates :product, :order,
            presence: true
  validates :item_price,
            absence: true

  before_create :initialize_item_price

  scope :bulk, -> (quantity = 100) { where("quantity >= ?", quantity) }

  def to_s
    "order of #{client} at #{created_at}"
  end

  def price
    self.quantity * self.item_price
  end

  protected

  def initialize_item_price
    self.item_price = self.product.price
  end
end