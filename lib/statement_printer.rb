class StatementPrinter
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts "date || credit || debit || balance"
    @transactions.each do |tr|
      puts "#{tr[:date]} || #{tr[:amount]} || || #{tr[:balance]}"
    end
  end
end
