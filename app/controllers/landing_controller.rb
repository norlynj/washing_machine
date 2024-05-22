class LandingController < ApplicationController
  before_action :authenticate_user!

  def index
        @orders_today = Order.created_today.count
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        render
    end
end
