class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :invoiced_parts
  has_many :parts, through: :invoiced_parts

  validates :customer, presence: true
  validates :description_mo, presence: true
  validates :time_mo, presence: true

  monetize :total_price_cents
  monetize :price_mo_cents

  accepts_nested_attributes_for :invoiced_parts, :reject_if => :all_blank, :allow_destroy => true

  def define_parts_ttc_price
    self.invoiced_parts.each do |invoiced_part|
      invoiced_part.price_ttc = invoiced_part.price_ht * 1.2
      invoiced_part.save
    end
  end

  def define_parts_customer_price
    self.invoiced_parts.each do |invoiced_part|
      discount = (invoiced_part.discount_provider/100.0)
      price_brut = invoiced_part.price_ht / (1 - discount)
      price_net = price_brut * 1.2
      margin = discount + 0.05
      # 1.25 and not 1.2 because charges are paid on the CA
      charges_social_parts = 1.25

      price_before_charges = invoiced_part.price_ttc + (price_net * margin)
      invoiced_part.price_customer = price_before_charges * charges_social_parts

      invoiced_part.save
    end
  end

  def define_price_mo(mechanic)
    self.price_mo = self.time_mo * mechanic.price_per_hour
  end

  def define_total_price
    total_price_parts = 0

    self.invoiced_parts.each do |invoiced_part|
      total_price_parts += invoiced_part.price_customer
    end

    self.total_price = total_price_parts + self.price_mo
    self.save
  end
end