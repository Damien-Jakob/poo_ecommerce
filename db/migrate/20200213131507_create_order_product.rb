class CreateOrderProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_products do |t|
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
    end

    add_reference(:orders_products, :orders, foreign_key: true)
    add_reference(:orders_products, :products, foreign_key: true)
  end
end
