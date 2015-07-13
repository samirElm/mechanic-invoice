class Users::InvoicesController < ApplicationController

  def index
    @invoices = current_user.invoices.sort_by { |invoice| invoice.created_at }.reverse
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Facture-#{@invoice.id}",
               layout: 'layouts/application.pdf.erb',  # layout used
               show_as_html: params[:debug].present?
      end
    end
  end

  def new
    @invoice = current_user.invoices.build
    @invoice.invoiced_parts.build
    @parts = current_user.parts
    @customers = current_user.customers
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)
    @invoice.define_price_mo(current_user)

    if @invoice.save
      @invoice.define_parts_ttc_price
      @invoice.define_total_price

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
    params.require(:invoice).permit(:customer_id, :description_mo, :time_mo, invoiced_parts_attributes: [:part_id, :price_ht, :ref, :discount_provider, :quantity, :_destroy])
  end
end