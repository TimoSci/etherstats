class ApplicationController < ActionController::Base

    before_action :set_connection

    def connection
      @connection ||= Connection.new
    end

    def client
      @client ||= connection.client
    end

    private

    def set_connection
      @blockchain = Blockchain.new(connection)
      Block.blockchain = @blockchain
    end

end
