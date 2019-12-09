class BlocksController < ApplicationController

  def index
    @latest_bock = connection.latest_block
  end

  def show
  end

end
