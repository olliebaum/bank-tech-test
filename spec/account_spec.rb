require 'account'

describe Account do
  list1 = [{ credit: 100, balance: 100 }]
  let(:mock_transactions) {
    instance_double(TransactionHistory, add_transaction: nil, list: list1)
  }  
  let(:mock_printer_1) {
    instance_double(StatementPrinter, print: nil)
  }  
  let(:mock_printer_class) {
    double("mock_printer_class", new: mock_printer_1)
  }  

  subject { Account.new(mock_transactions, mock_printer_class) }

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

    it 'delegate receives #add_transaction' do
      subject.deposit(100)
      expect(mock_transactions).to have_received(:add_transaction).with(100, nil, 100)
    end
  end

  context '#withdraw' do
    before do
      subject.deposit(100)
      subject.withdraw(10)
    end

    it 'can take money from the account' do
      expect(subject.balance).to eq 90
    end

    it 'delegate receives #add_transaction' do
      expect(mock_transactions).to have_received(:add_transaction).with(nil, 10, 90)
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
