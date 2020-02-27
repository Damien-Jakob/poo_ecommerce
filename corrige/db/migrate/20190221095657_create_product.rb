class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.decimal :price, precision: 8, scale: 2, null: false
      t.string :description, limit: 300
      t.references :category, foreign_key: true      
    end
  end
end
