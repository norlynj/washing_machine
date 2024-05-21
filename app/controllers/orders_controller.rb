class OrdersController < ApplicationController
    # before_action :set_order, only: [:edit, :update, :destroy]

    def index
      @orders = Order.all
    end

    def create
      @order = Order.new(order_params.merge(staff_id: current_user.id))

      if @order.save
        redirect_to orders_path, notice: 'Order was successfully created.'
      else
        p "#{@order.errors.full_messages}================================================================"
        redirect_to orders_path, notice: 'Order creation failed .'
      end
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def set_total (classification, num_detergents, weight)
      # Perform calculations
      base_price = classification == "Bed Linens" ? 180 : 150
      num_detergents = num_detergents.to_i
      load = (weight.to_f / 7).ceil

      # Calculate total without additional detergent fee if num_detergents is auto-calculated
      if num_detergents == load * 3
        total = load * base_price
      else
        detergent_price = 15
        total = load * base_price + (num_detergents - load * 3) * detergent_price
      end

      return total.round(2)
    end

    def order_params
      total_amount = set_total(params[:classification], params[:num_detergents], params[:weight])
      params.permit(:customer_id, :status, :weight, :payment_method, :classification, :staff_id, :add_instructions).merge(total_amount: total_amount)
    end
  end
  