class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :invoiced_parts
end
