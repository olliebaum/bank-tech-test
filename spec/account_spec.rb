require 'account'
require 'timecop'

describe Account do
  let(:mock_transaction) { spy("mock_transaction", add_transaction: nil, list: { date: DateTime.now, credit: 100, balance: 100 }) }
  let(:mock_printer_1) { spy("StatementPrinter") }
  let(:mock_printer_class) { spy("mock_printer_class", new: mock_printer_1) }
  subject { Account.new(mock_transaction, mock_printer_class) }
  Timecop.freeze(DateTime.now)

  context '#initialize' do
    it 'has a starting balance of 0' do
      expect(subject.balance).to eq 0
    end
  end
  context '#deposit' do
    it 'can add money to the account' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end
  end
  context '#withdraw' do
    it 'can take money from the account' do
      subject.deposit(100)
      subject.withdraw(10)
      expect(subject.balance).to eq 90
    end
  end
  context '#statement' do
    it 'delegate receives #new' do
      subject.statement
      expect(mock_printer_class).to have_received(:new)
    end
    it 'delegate instance receives #print' do
      subject.statement
      expect(mock_printer_1).to have_received(:print)
    end
  end
end
