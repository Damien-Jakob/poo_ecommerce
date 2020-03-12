class CreateSupplier < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name, limit: 50, null: false
    end

    add_reference(:products, :supplier, foreign_key: true)
  end
end
