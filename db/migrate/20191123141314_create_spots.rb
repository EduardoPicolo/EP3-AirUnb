class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :address
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
