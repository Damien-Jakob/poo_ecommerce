class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity,
            numericality: {
                greater_than_or_equal_to: 1
            }
  validates :product,
            presence: true

  scope :bulk, -> (quantity = 100) { where("quantity >= ?", quantity) }

  def to_s
    "order of #{client} at #{created_at}"
  end

  def price
    self.quantity * self.item_price
  end
end