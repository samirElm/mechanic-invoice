class MonetizeInvoiceForPriceMo < ActiveRecord::Migration
  def change
    add_monetize :invoices, :price_mo
  end
end
