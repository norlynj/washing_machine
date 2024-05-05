class TransactionsController < ApplicationController

  def index
      @orders = Order.all
  end
end