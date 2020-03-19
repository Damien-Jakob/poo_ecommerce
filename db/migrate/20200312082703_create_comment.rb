class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :subject, polymorphic: true
    end

      # add_reference :comments, :subject, polymorphic: true
  end
end
