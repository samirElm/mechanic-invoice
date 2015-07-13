class AddUserIdToPart < ActiveRecord::Migration
  def change
    add_reference :parts, :user, index: true, foreign_key: true
  end
end
