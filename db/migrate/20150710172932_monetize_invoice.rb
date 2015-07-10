class MonetizeInvoice < ActiveRecord::Migration
  def change
    add_monetize :invoices, :total_price
  end
end
