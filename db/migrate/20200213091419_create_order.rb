class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :client
      t.datetime :created_at
      t.datetime :shipped_at
      t.string :status, limit: 20
    end

    add_foreign_key :cli, :products

  end
end
