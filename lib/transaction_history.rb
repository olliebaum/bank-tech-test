class TransactionHistory
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit = nil, debit = nil, balance)
    @transactions << { date: Date.today,
             credit: credit,
              debit: debit,
            balance: balance }
  end

  def print
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |tr|
      date_str = tr[:date].strftime("%d/%m/%Y")
      credit_str = "%.2f" % tr[:credit] unless tr[:credit].nil?
      debit_str = "%.2f" % tr[:debit] unless tr[:debit].nil?
      balance_str = "%.2f" % tr[:balance] unless tr[:balance].nil?
      puts "#{date_str} || #{credit_str} || #{debit_str} || #{balance_str}"
    end
  end
end
