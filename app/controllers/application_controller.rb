class ApplicationController < ActionController::Base

    def connection
      @connection ||= Connection.new
    end

    def client
      @client ||= connection.client
    end

end
