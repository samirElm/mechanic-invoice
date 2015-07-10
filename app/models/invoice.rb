class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :invoiced_parts
  has_many :parts, through: :invoiced_parts

  monetize :total_price_cents

  accepts_nested_attributes_for :invoiced_parts, :reject_if => :all_blank, :allow_destroy => true

  def define_parts_ttc_price
    self.invoiced_parts.each do |invoiced_part|
      invoiced_part.price_ttc = invoiced_part.price_ht * 1.2
      invoiced_part.save
    end
  end
end
