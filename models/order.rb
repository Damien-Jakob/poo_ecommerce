class Order < ActiveRecord::Base
  # validation : min one order_item
  validate :contain_item

  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  protected

  def contain_item
    if order_items.count < 1
      errors.add(:base, "No items ordered!")
    end
  end

  def to_s
    "order of #{client} at #{created_at}"
  end
end