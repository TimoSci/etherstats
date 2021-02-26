class TransactionsController < ApplicationController

  def index
    @latest_transactions = Block.latest.transaction_objects
  end

  def show

  end

end
