class Order < ActiveRecord::Base
  # presence: true for a table -> table must have at least one element
  validates :order_items, :client,
            presence: true
  # validate :contain_item
  validates_associated :order_items

  belongs_to :client
  has_many :order_items, inverse_of: :order
  has_many :products, through: :order_items

  def total_price
    self.order_items.sum(&:price)
  end

  def to_s
    "order of #{client} at #{created_at}"
  end

  protected

  # obsolete
  def contain_item
    # DO NOT USE COUNT : IS IS 0 AS LONG AS THE ORDER HAS NOT BEEN SAVED
    if order_items.size < 1
      errors.add(:base, "No items ordered!")
    end
  end
end