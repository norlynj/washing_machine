class AnalyticsController < ApplicationController

  def index
    @month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November','December']
    @users = User.all
    @customers = Customer.all
  end

end