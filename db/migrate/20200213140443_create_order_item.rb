class CreateOrderItem < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :item_price, precision: 10, scale: 2
    end

    add_reference(:order_items, :order, foreign_key: true)
    add_reference(:order_items, :product, foreign_key: true)
  end
end
