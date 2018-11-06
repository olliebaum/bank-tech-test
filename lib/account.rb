require 'date'

class Account
  attr_reader :balance

  def initialize(transactions = TransactionHistory.new,
                      printer = StatementPrinter)
    @balance = 0
    @transactions = transactions
    @printer = printer
  end

  def deposit(sum)
    @balance += sum
    @transactions.add_transaction(sum, nil, @balance)
  end

  def withdraw(sum)
    raise "You can't withdraw more than your balance." if sum > @balance
    @balance -= sum
    @transactions.add_transaction(nil, sum, @balance)
  end

  def statement
    @printer.new(@transactions.list).print
  end
end
