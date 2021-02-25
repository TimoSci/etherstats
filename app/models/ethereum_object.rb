class EthereumObject < Hash

  class << self

    attr_accessor :blockchain

    def client
      blockchain.connection.client
    end

    def connection
      blockchain.connection
    end

  end

end
