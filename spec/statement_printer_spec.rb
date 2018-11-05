require 'statement_printer'
require 'timecop'

describe StatementPrinter do
  before(:each) do
    Timecop.freeze(DateTime.now)
  end
  context '#print' do
    it 'prints out a deposit transaction' do
      transactions = [{
        date: DateTime.now,
        amount: 100,
        balance: 100
      }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
        "#{DateTime.now} || 100 || || 100\n"
      expect{printer.print}.to output(statement_str).to_stdout
    end
  end
end
