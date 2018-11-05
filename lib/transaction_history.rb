class TransactionHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_transaction(date, amount, balance)
    @list << { date: date, amount: amount, balance: balance }
  end
end
