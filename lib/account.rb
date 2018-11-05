class Account
  attr_reader :balance

  def initialize(transactions = TransactionHistory.new)
    @balance = 0
    @transactions = transactions
  end

  def deposit(sum)
    @balance += sum
  end

  def withdraw(sum)
    @balance -= sum
  end
end
