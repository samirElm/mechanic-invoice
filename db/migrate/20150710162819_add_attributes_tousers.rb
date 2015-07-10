class AddAttributesTousers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :siret, :string
    add_column :users, :price_mo, :string
  end
end
