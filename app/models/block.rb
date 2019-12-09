class Block < Hash

  class << self
    attr_accessor :blockchain

    def latest
      block = client.eth_get_block_by_number('latest', true)["result"]
      Block.new.merge(block)
    end

    def client
      self.blockchain.connection.client
    end

  end

  @@keys = ["author",
 "difficulty",
 "extraData",
 "gasLimit",
 "gasUsed",
 "hash",
 "logsBloom",
 "miner",
 "mixHash",
 "nonce",
 "number",
 "parentHash",
 "receiptsRoot",
 "sealFields",
 "sha3Uncles",
 "size",
 "stateRoot",
 "timestamp",
 "totalDifficulty",
 "transactions",
 "transactionsRoot",
 "uncles"]

  @@keys.each do |key|
    define_method(key.underscore) do
     self[key]
    end
  end


  #===



end
