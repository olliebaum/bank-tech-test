class TransactionHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_transaction(credit = nil, debit = nil, balance)
    @list << { date: Date.today,
             credit: credit,
              debit: debit,
            balance: balance }
  end
end
