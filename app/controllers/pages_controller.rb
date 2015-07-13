class PagesController < ApplicationController

  def dashboard
    @monthly_ca = current_user.calculate_monthly_ca
    @monthly_invoices = current_user.define_month_invoices
    @monthly_net_profit = current_user.calculate_monthly_net_profit_total
    @monthly_mo_hours = current_user.calculate_monthly_mo_hours


    @year_balance_elements = current_user.calculate_year_ca_per_month
    @year_charges_elements = current_user.calculate_year_charges_social_per_month

    @invoices_five_last = current_user.invoices[0, 5].sort_by { |invoice| invoice.created_at }.reverse
  end
end