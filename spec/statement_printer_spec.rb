require 'statement_printer'
require 'timecop'

describe StatementPrinter do
  before(:each) do
    Timecop.freeze(Date.today)
  end

  context '#print' do
    let(:formatted_date) { Date.today.strftime("%d/%m/%Y") }

    it 'displays a deposit transaction' do
      transactions = [{ date: formatted_date,
                        credit: 100,
                        balance: 100 }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} || 100 ||  || 100\n"
      expect{ printer.print }.to output(statement_str).to_stdout
    end

    it 'displays a withdraw transaction' do
      transactions = [{ date: formatted_date,
                        debit: 10,
                        balance: 90 }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} ||  || 10 || 90\n"
      expect{ printer.print }.to output(statement_str).to_stdout
    end
  end
end
