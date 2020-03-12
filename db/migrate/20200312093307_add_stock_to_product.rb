class AddStockToProduct < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.integer :stock
    end
  end
end
