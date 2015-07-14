class AddPriceCustomerToInvoicedPart < ActiveRecord::Migration
  def change
    add_monetize :invoiced_parts, :price_customer
  end
end
