class TransactionHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_transaction(credit = nil, debit = nil, balance)
    formatted_date = Date.today.strftime("%d/%m/%Y")
    @list << { date: formatted_date,
             credit: credit != nil ? "%.2f" % credit : nil,
              debit: debit != nil ? "%.2f" % debit : nil,
            balance: "%.2f" % balance }
  end
end
