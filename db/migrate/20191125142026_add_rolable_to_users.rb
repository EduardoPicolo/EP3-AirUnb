class AddRolableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rolable_id, :integer
    add_column :users, :rolable_type, :string

    add_index :users, [:rolable_type, :rolable_id]
  end
end
