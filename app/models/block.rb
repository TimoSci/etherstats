class Block < EthereumObject
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


    def latest
      block = client.get_block_by_number_('latest', true)
      new.merge(block)
    end

    def find_by_number(number)
      block = client.get_block_by_number_(number, true)
      new.merge(block)
    end

    def find_latest(count)
      latest_number = connection.block_number
      lowest = latest.number-count+1
      lowest = 0 if lowest < 0
      (lowest..latest_number).map{|number| find_by_number(number)}
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
