class TransactionHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_transaction(date, credit = nil, debit = nil, balance)
    @list << { date: date, credit: credit, debit: debit, balance: balance }
  end
end
