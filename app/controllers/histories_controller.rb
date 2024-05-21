class HistoriesController < ApplicationController
    def index
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders
    end
  
    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
        redirect_to histories_path, notice: 'Order status successfully updated.'
      else
        flash.now[:alert] = 'Failed to update status. Try again later.'
        redirect_to histories_path
      end
    end
  
    private
  
    def order_params
      params.permit(:status)
    end
  end
  