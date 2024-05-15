class TransactionsController < ApplicationController

  def index
    @transactions = if params[:search]
      CustomerTransaction.joins(:customer).where("customers.name LIKE ?", "%#{params[:search]}%").distinct
    else
      CustomerTransaction.all
    end
  end
end