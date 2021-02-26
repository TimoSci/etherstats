class Transaction < EthereumObject

  @keys = {}
  @keys[:data] =
  %w[
    hash
    blockHash
    from
    to
    input
    r
    s
  ]

  @keys[:quantity] =
  %w[
    blockNumber
    gas
    gasPrice
    nonce
    transactionIndex
    value
    v
  ]

  @keys[:quantity].each do |key|
    define_method(key.underscore) do
      self[key].to_i(16)
    end
  end

  @keys[:data].each do |key|
    define_method(key.underscore) do
      self[key]
    end
  end


  class << self

    def get_by_hash(hash)
      transaction = client.get_transaction_by_hash(number, true)
      new.merge(transaction)
    end

  end

end
