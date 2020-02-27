class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_item

  scope :cheap, -> { where("price <= 20") }

  def to_s
    "#{name}"
  end
end
