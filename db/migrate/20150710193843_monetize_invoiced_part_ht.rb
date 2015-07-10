class MonetizeInvoicedPartHt < ActiveRecord::Migration
  def change
    add_monetize :invoiced_parts, :price_ht
  end
end
