class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.decimal :price, precision: 10, scale: 2
      t.string :description, limit: 255
    end
  end
end
