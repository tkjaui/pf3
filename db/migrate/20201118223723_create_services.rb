class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :company
      t.string :device
      t.string :problem
      t.integer :price
      t.integer :days
      t.string :result
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
