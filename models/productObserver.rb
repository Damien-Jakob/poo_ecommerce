require 'rails/observers/activerecord/active_record'
# Not sure if necessary
require_relative 'product'

class ProductObserver < ActiveRecord::Observer
  observe :product

  def after_save(product)
    if product.stock < 5
      puts "ALERT : #{product} has to be restocked (#{ product.stock } units in stock)"
    end
  end
end
