class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(sum)
    @balance += sum
  end

  def withdraw(sum)
    @balance -= sum
  end
end
