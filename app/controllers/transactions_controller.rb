class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = if params[:search]
      Order.joins(:customer).where("customers.name LIKE ?", "%#{params[:search]}%").distinct
    else
      Order.all
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to transaction_path, notice: 'Transaction successfully deleted.'
  end
end