class Block < Hash
  @keys = {}
  @keys[:data] =
  %w[
    author
    extraData
    hash
    logsBloom
    miner
    mixHash
    nonce
    parentHash
    receiptsRoot
    sealFields
    sha3Uncles
    stateRoot
    transactions
    transactionsRoot
    uncles
  ]

  @keys[:quantity] =
  %w[
    number
    difficulty
    totalDifficulty
    size
    gasLimit
    gasUsed
    timestamp
    size
  ]

  @keys[:array] =
  %w[
    transactions
    uncles
  ]

  class << self
    attr_accessor :blockchain

    def latest
      connection.client.eth_block_number['result'].to_i(16)
      # block = client.eth_get_block_by_number('latest', true)['result']
      # Block.new.merge(block)
    end

    def find_by_number(number)
      block = client.eth_get_block_by_number(number, true)['result']
      Block.new.merge(block)
    end

    def find_latest(number)
      latest_number = latest.number
      (latest.number..)
    end

    def client
      blockchain.connection.client
    end

  end


  @keys[:quantity].each do |key|
    define_method(key.underscore) do
      self[key].to_i(16)
    end
  end

  (@keys[:data]+@keys[:array]).each do |key|
    define_method(key.underscore) do
      self[key]
    end
  end

  def previous
    self.class.find_by_number(number.to_i(16))
  end

  # Time.at(t)

end
