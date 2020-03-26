class Category < ActiveRecord::Base
  has_many :products
  has_many :orders, through: :products

  # find cleaner implementation
  # scope :orderless, -> { where.not(id: Product.ordered.select(:category_id).distinct) }
  scope :orderless, -> { where.not(id: joins(:orders)) }
  # WHERE id NOT IN (???)

  def to_s
    "#{name}"
  end
end