class CustomersController < ApplicationController

  def index
    @customers = if params[:search]
                  Customer.where("name LIKE ?", "%#{params[:search]}%")
                else
                  Customer.all
                end
  end

  def create
    @customer = Customer.new(customer_create_params)

      if @customer.save
        redirect_to customers_path, notice: 'Customer was successfully created.'
      else
        redirect_to customers_path, error: 'Customer creation failed.'
      end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

    
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      # Handle successful user update
      redirect_to customer_path(@customer), notice: 'User was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update user.'
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :contact_info, :address)
  end

  def customer_create_params
    params.permit(:name, :contact_info, :address)
  end

end
