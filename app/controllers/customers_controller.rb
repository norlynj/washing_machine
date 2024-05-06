class CustomersController < ApplicationController

  def index
    @customers = if params[:search]
                  Customer.where("name LIKE ?", "%#{params[:search]}%")
                else
                  Customer.all
                end
      end


end