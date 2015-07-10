class MonetizeUser < ActiveRecord::Migration
  def change
    add_monetize :users, :price_per_hour
  end
end
