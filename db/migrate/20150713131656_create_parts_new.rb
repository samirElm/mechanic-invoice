class CreatePartsNew < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
    end
  end
end
