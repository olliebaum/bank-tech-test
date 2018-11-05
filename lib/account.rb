class Account
  attr_reader :balance

  def initialize(transactions = TransactionHistory.new)
    @balance = 0
    @transactions = transactions
  end

  def deposit(sum)
    @balance += sum
    @transactions.add_transaction(DateTime.now, +sum, @balance)
  end

  def withdraw(sum)
    @balance -= sum
    @transactions.add_transaction(DateTime.now, -sum, @balance)
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.list.each {|tr|
      puts "#{tr[:date]} || #{tr[:amount]} || || #{tr[:balance]}"
    }
  end
end
