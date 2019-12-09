class Block < Hash

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

  def self.latest
    puts "<<<placeholder for latest block>>>"
  end



end
