class MonetizeInvoicedPart < ActiveRecord::Migration
  def change
    add_monetize :invoiced_parts, :price_ttc
  end
end
