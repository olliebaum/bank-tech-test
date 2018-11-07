require 'statement_printer'
require 'timecop'

describe StatementPrinter do
  before(:each) do
    Timecop.freeze(Date.today)
  end

  context '#print' do
    let(:formatted_date) { Date.today.strftime("%d/%m/%Y") }

    it 'displays a deposit transaction' do
      transactions = [{ date: Date.today,
                        credit: 100,
                        balance: 100 }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} || 100.00 ||  || 100.00\n"
      expect { printer.print }.to output(statement_str).to_stdout
    end

    it 'displays a withdraw transaction' do
      transactions = [{ date: Date.today,
                        debit: 10,
                        balance: 90 }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} ||  || 10.00 || 90.00\n"
      expect { printer.print }.to output(statement_str).to_stdout
    end

    it 'prints transactions in reverse order' do
      transactions = [{ date: Date.today,
                        credit: 123,
                        balance: 123 },
                      { date: Date.today,
                        credit: 456,
                        balance: 579 }]
      printer = StatementPrinter.new(transactions)
      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} || 456.00 ||  || 579.00\n" +
                      "#{formatted_date} || 123.00 ||  || 123.00\n"
      expect { printer.print }.to output(statement_str).to_stdout
    end
  end
end
