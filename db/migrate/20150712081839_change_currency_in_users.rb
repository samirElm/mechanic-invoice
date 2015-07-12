class ChangeCurrencyInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :price_per_hour_currency, "EUR"
  end
end
