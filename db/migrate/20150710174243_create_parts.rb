class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
    end
  end
end
