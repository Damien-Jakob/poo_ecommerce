class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :supplier
  has_many :order_items
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

  scope :cheap, -> (max_price = 0.20) { where('price <= ?', max_price) }

  def to_s
    "#{name}"
  end
end
