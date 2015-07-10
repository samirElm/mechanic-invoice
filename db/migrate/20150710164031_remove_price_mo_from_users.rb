class RemovePriceMoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :price_mo, :string
  end
end
