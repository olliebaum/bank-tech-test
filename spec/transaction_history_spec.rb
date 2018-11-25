require 'transaction_history'
require 'timecop'

describe TransactionHistory do
  context '#add_transaction' do
    before { Timecop.freeze(Date.today) }

    it 'stores a transaction' do
      subject.add_transaction(100, nil, 100)
      expect(subject.transactions).to eq [{ date: Date.today, credit: 100, debit: nil, balance: 100 }]
    end
  end

  context '#print' do
    Timecop.freeze(Date.today)
    let(:formatted_date) { Date.today.strftime("%d/%m/%Y") }

    it 'displays a deposit transaction' do

      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} || 100.00 ||  || 100.00\n"
      subject.add_transaction(100, nil, 100)
      expect { subject.print }.to output(statement_str).to_stdout
    end

    it 'displays a withdraw transaction' do

      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} ||  || 10.00 || 90.00\n"
      subject.add_transaction(nil, 10, 90)
      expect { subject.print }.to output(statement_str).to_stdout
    end

    it 'prints transactions in reverse order', focus:true do

      statement_str = "date || credit || debit || balance\n" +
                      "#{formatted_date} || 456.00 ||  || 579.00\n" +
                      "#{formatted_date} || 123.00 ||  || 123.00\n"

      subject.add_transaction(123, nil, 123)
      subject.add_transaction(456, nil, 579)
      expect { subject.print }.to output(statement_str).to_stdout
    end
  end
end
