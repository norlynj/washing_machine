class LandingController < ApplicationController
  before_action :authenticate_user!

  def index
        @loads = 0
        @orders = Order.created_today.all
        @orders.each do |order|
          @loads = @loads + (order.weight.to_f / 7).ceil
        end
        @orders_today = Order.created_today.count
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        
        render
  end

end
