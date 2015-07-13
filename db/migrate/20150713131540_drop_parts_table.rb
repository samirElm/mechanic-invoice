class DropPartsTable < ActiveRecord::Migration
  def change
    drop_table :parts
  end
end
