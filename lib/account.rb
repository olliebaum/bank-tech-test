require 'date'
require 'transaction_history'

class Account
  attr_reader :balance
  INITIAL_BALANCE = 0

  def initialize(transactions = TransactionHistory.new)
    @balance = INITIAL_BALANCE
    @transactions = transactions
  end

  def deposit(sum)
    raise 'You can only deposit in whole pounds and pence.' if sum != sum.round(2)
    raise 'You can only deposit positive sums.' if sum.negative?
    @balance += sum
    @transactions.add_transaction(sum, nil, @balance)
  end

  def withdraw(sum)
    raise 'You can only withdraw in whole pounds and pence.' if sum != sum.round(2)
    raise 'You can only withdraw positive sums.' if sum.negative?
    raise "You can't withdraw more than your balance." if sum > @balance
    @balance -= sum
    @transactions.add_transaction(nil, sum, @balance)
  end

  def statement
    @transactions.print
  end
end
