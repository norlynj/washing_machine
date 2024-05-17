class TransactionsController < ApplicationController

  def index
    @transactions = if params[:search]
      CustomerTransaction.joins(:customer).where("customers.name LIKE ?", "%#{params[:search]}%").distinct
    else
      CustomerTransaction.all
    end
  end

  def destroy
    Transaction.find(params[:id]).destroy
    redirect_to transaction_crew_index_path, notice: 'Transaction successfully deleted.'
  end
end