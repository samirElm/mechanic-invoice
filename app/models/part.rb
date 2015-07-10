class Part < ActiveRecord::Base
  has_many :invoiced_parts
  has_many :invoices, through: :invoiced_parts
end
