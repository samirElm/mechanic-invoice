class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  monetize :price_per_hour_cents

  has_many :customers
  has_many :invoices

  def calculate_monthly_ca
    monthly_ca = 0
    invoices_current_month = define_month_invoices

    invoices_current_month.each do |invoice|
      monthly_ca += invoice.total_price
    end

    return monthly_ca
  end

  def calculate_monthly_invoices
    monthly_invoices = define_month_invoices

    return monthly_invoices
  end

  def calculate_monthly_net_profit
    monthly_ca = self.calculate_monthly_ca
    monthly_parts_expenses = 0

    invoices_current_month = define_month_invoices

    invoices_current_month.each do |invoice|
      invoice.invoiced_parts.each do |invoiced_part|
        monthly_parts_expenses += invoiced_part.price_ht
      end
    end

    monthly_net_profit = monthly_ca - monthly_parts_expenses

    return monthly_net_profit
  end

  def calculate_monthly_mo_hours
    invoices_current_month = define_month_invoices
    mo_hours = 0

    invoices_current_month.each do |invoice|
      mo_hours += invoice.time_mo
    end

    return mo_hours
  end


  private

  def define_month_invoices
    self.invoices.where('created_at > ?', Date.today.at_beginning_of_month)
  end
end












