class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_address, :string
    add_column :users, :cnpj, :integer
  end
end
