class Transaction < EthereumObject

  class << self

    def get_by_hash(hash)
      transaction = client.get_transaction_by_hash(number, true)
      new.merge(transaction)
    end

  end

end
