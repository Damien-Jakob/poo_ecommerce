class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :supplier
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments, as: :subject

  validates :category, :supplier,
            presence: true
  validates :name,
            length: {
                minimum: 2,
                maximum: 50,
            }
  validates :price,
            numericality: {
                greater_than: 0,
            }
  validates :stock,
            numericality: {
                greater_than: 0,
                only_integer: true,
            }

  scope :cheap, -> (max_price = 0.20) { where('price <= ?', max_price) }
  scope :ordered, -> { left_joins(:order_items).where.not(order_items: {id: nil}) }

  def to_s
    name
  end
end
