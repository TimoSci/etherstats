class BlocksController < ApplicationController

  def index
    @latest_block = Block.latest
    # @latest_block = connection.latest_block
  end

  def show
  end

end
