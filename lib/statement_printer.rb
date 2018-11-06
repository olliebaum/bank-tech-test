class StatementPrinter
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts "date || credit || debit || balance"
    @transactions.each do |tr|
      puts "#{tr[:date]} || #{tr[:credit]} || #{tr[:debit]} || #{tr[:balance]}"
    end
  end
end
