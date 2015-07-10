class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :invoiced_parts
  has_many :parts, through: :invoiced_parts

  accepts_nested_attributes_for :invoiced_parts, :reject_if => :all_blank, :allow_destroy => true
end
