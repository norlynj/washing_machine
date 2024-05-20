class CustomersController < ApplicationController

  def index
    @customers = if params[:search]
                  Customer.where("name LIKE ?", "%#{params[:search]}%")
                else
                  Customer.all
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

end
