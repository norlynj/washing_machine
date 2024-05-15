class TransactionsController < ApplicationController

  def index
      @transactions = CustomerTransaction.all
  end
end