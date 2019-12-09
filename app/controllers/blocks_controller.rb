class BlocksController < ApplicationController

  def index
    @connection = Connection.new
    @latest_bock = @connection.latest_block
  end

  def show
  end

end
