class TransactionsController < ApplicationController

  def index
    @transactions = if params[:search]
      Order.joins(:customer).where("customers.name LIKE ?", "%#{params[:search]}%").distinct
    else
      Order.all
    end
  end

  def destroy
    Transaction.find(params[:id]).destroy
    redirect_to transaction_crew_index_path, notice: 'Transaction successfully deleted.'
  end
end