class Account
  attr_reader :balance

  def initialize(transactions = TransactionHistory.new, printer = StatementPrinter)
    @balance = 0
    @transactions = transactions
    @printer = printer
  end

  def deposit(sum)
    @balance += sum
    @transactions.add_transaction(DateTime.now, sum, nil, @balance )
  end

  def withdraw(sum)
    @balance -= sum
    @transactions.add_transaction(DateTime.now, nil, sum, @balance )
  end

  def statement
    @printer.new(@transactions.list).print
  end
end
