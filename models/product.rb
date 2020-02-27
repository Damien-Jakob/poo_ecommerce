class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items

  scope :cheap, -> (max_price = 0.20) { where('price <= ?', max_price) }

  def to_s
    "#{name}"
  end
end
