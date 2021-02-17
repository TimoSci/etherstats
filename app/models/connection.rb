





class Connection

    include Format
    include RpcCommands

    attr_reader :client
    # @endpoint = 'http://192.168.1.106:8545'

    def initialize(client=Ethereum::HttpClient.new(Rails.configuration.geth_endpoint))
      @client = client
       # @connection = JSONRPC::Client.new("http://localhost:8545")
       # @connection = JSONRPC::Client.new("http://89.207.129.69:8545")
      add_short_commands(@client)
    end

    def block_number
       client.block_number_.to_i(16)
    end

    def gas_price
      hex_to_sci2 client.eth_gas_price["result"]
    end

    private

    def add_short_commands(client)
       (RPC_COMMANDS + RPC_MANAGEMENT_COMMANDS).each do |rpc_command|
         method_name = rpc_command.underscore
         if method_name =~ /\Aeth_/
            short_name = method_name.scan(/\Aeth_(.*)/).first.first
            short_name = short_name+"_"
            client.class.define_method(short_name) do |*args|
               client.send(method_name,*args)['result']
            end
         end
       end
    end

end

       # client = Ethereum::HttpClient.new('http://localhost:8545')
