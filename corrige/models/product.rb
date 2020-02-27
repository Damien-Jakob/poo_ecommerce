class Product < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  
  belongs_to :category
  
  def to_s
    name
  end
end
