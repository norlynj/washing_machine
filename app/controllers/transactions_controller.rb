class TransactionsController < ApplicationController

  def index
    @transactions = if params[:search]
      CustomerTransaction.joins(:customer).where("customers.name LIKE ?", "%#{params[:search]}%").distinct
    else
      CustomerTransaction.all
    end
  end

  def destroy
    @transaction=CustomerTransaction.find(params[:id])
    @transaction.destroy
    
    redirect_to transactions_path, notice: 'Transaction successfully deleted.'

    #redirect_to transactions_path, status: :see_other
    #Transaction.find(params[:id]).destroy
    #redirect_to transaction_crew_index_path, notice: 'Transaction successfully deleted.'
  end
end