class InvoicedPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :invoice
end
