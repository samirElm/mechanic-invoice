class Users::InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = current_user.invoices.build
    @invoice.invoiced_parts.build
    @parts = Part.all
    @customers = Customer.all
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)

    if @invoice.save
      @invoice.define_parts_ttc_price

      redirect_to users_invoice_path(@invoice)
    else
      flash[:alert] = "Erreur"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :description_mo, :time_mo, invoiced_parts_attributes: [:part_id, :price_ht, :ref, :_destroy])
  end
end