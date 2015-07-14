class InvoicedPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :invoice

  monetize :price_ttc_cents
  monetize :price_ht_cents
  monetize :price_customer_cents
end
