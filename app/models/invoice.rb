class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :invoiced_parts
  has_many :parts, through: :invoiced_parts

  monetize :total_price_cents
  monetize :price_mo_cents

  accepts_nested_attributes_for :invoiced_parts, :reject_if => :all_blank, :allow_destroy => true

  def define_parts_ttc_price
    self.invoiced_parts.each do |invoiced_part|
      discount = invoiced_part.discount_provider
      case discount
         when 30..100 then invoiced_part.price_ttc = invoiced_part.price_ht * 1.2
         when 1...30 then invoiced_part.price_ttc = invoiced_part.price_ht * 1.3
         when 0 then invoiced_part.price_ttc = invoiced_part.price_ht * 1.4
      end
      invoiced_part.save
    end
  end

  def define_price_mo(mechanic)
    self.price_mo = self.time_mo * mechanic.price_per_hour
  end

  def define_total_price
    total_price_parts = 0

    self.invoiced_parts.each do |invoiced_part|
      total_price_parts += invoiced_part.price_ttc
    end

    self.total_price = total_price_parts + self.price_mo
    self.save
  end
end