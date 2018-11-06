class TransactionHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_transaction(credit = nil, debit = nil, balance)
    formatted_date = Date.today.strftime("%d/%m/%Y")
    @list << { date: formatted_date,
             credit: credit,
              debit: debit,
            balance: balance }
  end
end
