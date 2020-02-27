class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items

  def to_s
    "order of #{client} at #{created_at}"
  end
end