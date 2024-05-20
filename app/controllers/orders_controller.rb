class OrdersController < ApplicationController
    #before_action :set_order, only: [:show, :edit, :update, :destroy]
  
    def index
      @orders = Order.all
    end
  
    def show
      @user = Order.find(params[:id])
    end
  
    def create
      @order = Order.new(order_params)
  
      if @order.save
        redirect_to orders_path, notice: 'Order was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_order
      @order = Order.find(params[:id])
    end
  
    def order_params
      params.permit(:customer_id, :status, :weight, :payment_method, :classification, :total_amount, :staff_id, :add_instructions)
    end
  end
  