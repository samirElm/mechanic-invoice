class Users::CustomersController < ApplicationController
  def index
    @customers = current_user.customers
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = current_user.customers.build
  end

  def create
    @customer = current_user.customers.build(customer_params)

    if @customer.save
      redirect_to users_customers_path
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

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :address, :immat)
  end
end