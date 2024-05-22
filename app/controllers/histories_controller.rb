class HistoriesController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end

  def update
      @order = Order.find_by(id: params[:id])
      # if @order.nil?
      #   flash.now[:alert] = 'Order not found.'
      #   redirect_to histories_path
      #   return
      # end
      
      customer_id = @order.customer_id
    
      if @order.update(order_params)
        redirect_to histories_path(customer_id: customer_id), notice: 'Order status successfully updated.'
      else
        flash.now[:alert] = 'Failed to update status. Try again later.'
        render :index
      end
    end
    
    
  
  def order_params
    params.permit(:status)
  end
end
  