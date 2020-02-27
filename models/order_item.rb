class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  scope :bulk, -> (quantity = 100) { where("quantity >= ?", quantity) }

  def to_s
    "order of #{client} at #{created_at}"
  end
end