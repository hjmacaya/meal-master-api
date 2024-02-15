class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :rut, :string
    add_column :users, :phone, :string
  end
end
