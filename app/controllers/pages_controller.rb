class PagesController < ApplicationController

  def dashboard
    @monthly_ca = current_user.calculate_monthly_ca
    @monthly_invoices = current_user.calculate_monthly_invoices
    @monthly_net_profit = current_user.calculate_monthly_net_profit
    @monthly_mo_hours = current_user.calculate_monthly_mo_hours
  end
end