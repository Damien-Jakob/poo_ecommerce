class Supplier < ActiveRecord::Base
  has_many :products
  has_many :categories, -> { distinct }, through: :products
  has_many :comments, as: :subject

  validates :name,
            length: {
                minimum: 2,
                maximum: 50,
            }

  def to_s
    name
  end
end