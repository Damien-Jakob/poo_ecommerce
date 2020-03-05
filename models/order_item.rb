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

  before_save :initialize_item_price

  scope :bulk, -> (quantity = 100) { where("quantity >= ?", quantity) }

  def to_s
    "order of #{client} at #{created_at}"
  end

  def price
    quantity * item_price
  end

  protected

  def initialize_item_price
    unless item_price
      self.item_price = product.price
    end
  end
end