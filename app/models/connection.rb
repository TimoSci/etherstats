
class Connection

    include Format

    attr_reader :client

    def initialize(client=Ethereum::HttpClient.new('http://localhost:8545'))
       @client = client
       # @connection = JSONRPC::Client.new("http://localhost:8545")
      # @connection = JSONRPC::Client.new("http://89.207.129.69:8545")
    end

    def latest_block
      block = connection.eth_getBlockByNumber('latest', true)
    end

    def gas_price
      hex_to_sci client.eth_gas_price["result"]
    end

end

       # client = Ethereum::HttpClient.new('http://localhost:8545')
