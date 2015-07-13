class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  monetize :price_per_hour_cents

  has_many :customers
  has_many :invoices
  has_many :parts


  def calculate_year_ca_per_month
    array_year_ca_per_month = []

    number_of_months = 1..Date.today.month
    number_of_months.to_a.each do |month_number|
      array_month = {}
      array_month[:monthly_mo_hours] = calculate_monthly_mo_hours(month_number)
      array_month[:monthly_ca] = calculate_monthly_ca(month_number)
      array_month[:monthly_net_profit] = calculate_monthly_net_profit_total(month_number)
      array_month[:monthly_invoices] = define_month_invoices(month_number).length

      array_year_ca_per_month << array_month

    end

    return array_year_ca_per_month
  end

  def calculate_year_charges_social_per_month
    array_year_charges_social_per_month = []

    number_of_months = 1..Date.today.month
    number_of_months.to_a.each do |month_number|
      array_month = {}
      array_month[:monthly_ca] = calculate_monthly_ca(month_number)
      array_month[:monthly_charges_social_mo] = calculate_monthly_charges_social_mo(month_number)
      array_month[:monthly_charges_social_parts] = calculate_monthly_charges_social_parts(month_number)
      array_month[:monthly_charges_social_total] = calculate_monthly_charges_social_total(month_number)

      array_year_charges_social_per_month << array_month

    end

    return array_year_charges_social_per_month
  end

  def calculate_monthly_ca(given_month = nil)
    monthly_ca = 0
    if given_month.nil?
      invoices_month = define_month_invoices
    else
      invoices_month = define_month_invoices(given_month)
    end
    invoices_month.each do |invoice|
      monthly_ca += invoice.total_price
    end

    return monthly_ca
  end

  def define_month_invoices(given_month = nil)
    if given_month.nil?
      self.invoices.where('extract(month  from created_at) = ?', Date.today.month)
    else
      self.invoices.where('extract(month  from created_at) = ? AND extract(year  from created_at) = ?', given_month, Date.today.year)
    end
  end

  def calculate_monthly_net_profit_total(given_month = nil)
    monthly_ca = self.calculate_monthly_ca(given_month)
    monthly_charges_social = calculate_monthly_charges_social_total(given_month)
    monthly_parts_expenses = calculate_monthly_parts_expenses(given_month)

    monthly_net_profit = monthly_ca - monthly_parts_expenses - monthly_charges_social

    return monthly_net_profit
  end

  def calculate_monthly_mo_hours(given_month = nil)
    invoices_month = define_month_invoices(given_month)
    mo_hours = 0

    invoices_month.each do |invoice|
      mo_hours += invoice.time_mo
    end

    return mo_hours
  end

  private

  def calculate_monthly_ca_parts(given_month = nil)
    invoices_current_month = define_month_invoices(given_month)
    monthly_parts_ca = 0

    invoices_current_month.each do |invoice|
      invoice.invoiced_parts.each do |invoiced_part|
        monthly_parts_ca += invoiced_part.price_ttc
      end
    end

    return monthly_parts_ca
  end

  def calculate_monthly_charges_social_total(given_month = nil)
    charges_social_mo = calculate_monthly_charges_social_mo(given_month)
    charges_social_parts = calculate_monthly_charges_social_parts(given_month)

    monthly_charges_social = charges_social_mo + charges_social_parts

    return monthly_charges_social
  end

  def calculate_monthly_charges_social_mo(given_month = nil)
    monthly_mo_hours = calculate_monthly_mo_hours(given_month)
    charges_social_mo = monthly_mo_hours * self.price_per_hour * 0.229

    return charges_social_mo
  end

  def calculate_monthly_charges_social_parts(given_month = nil)
    monthly_ca_parts = calculate_monthly_ca_parts(given_month)
    charges_social_parts = monthly_ca_parts * 0.133

    return charges_social_parts
  end

  def calculate_monthly_net_profit_parts(given_month = nil)
    monthly_parts_expenses = calculate_monthly_parts_expenses(given_month)
    monthly_parts_ca = calculate_monthly_ca_parts(given_month)

    return monthly_net_profit_parts = monthly_parts_ca - monthly_parts_expenses
  end

  def calculate_monthly_parts_expenses(given_month = nil)
    monthly_parts_expenses = 0

    invoices_current_month = define_month_invoices(given_month)

    invoices_current_month.each do |invoice|
      invoice.invoiced_parts.each do |invoiced_part|
        monthly_parts_expenses += invoiced_part.price_ht
      end
    end

    return monthly_parts_expenses
  end
end












