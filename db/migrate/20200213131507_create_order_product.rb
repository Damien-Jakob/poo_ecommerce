class CreateOrderItem < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_items do |t|
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
    end

    add_reference(:orders_items, :order, foreign_key: true)
    add_reference(:orders_items, :product, foreign_key: true)
  end
end
