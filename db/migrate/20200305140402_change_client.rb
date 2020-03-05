class ChangeClient < ActiveRecord::Migration[6.0]
  def change
    change_table :clients do |t|
      t.string :type
      t.string :name, limit: 50
    end
  end
end
