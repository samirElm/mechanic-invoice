class Part < ActiveRecord::Base
  belongs_to :user
  has_many :invoiced_parts
  has_many :invoices, through: :invoiced_parts
end
