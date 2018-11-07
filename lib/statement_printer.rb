class StatementPrinter
  def initialize(transactions)
    @transactions = transactions
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
