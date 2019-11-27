class AddHostIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :host_id, :integer
    add_index :spots, :host_id
  end
end
