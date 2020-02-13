class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :created_at
      t.datetime :shipped_at
      t.string :status, limit: 20
    end

    # order has a client_id foreign key
    add_reference(:orders, :clients, foreign_key: true)

  end
end
