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

  subject(:account) { Account.new(mock_transactions, mock_printer_class) }

  context '#deposit' do
    it 'can add money to the account' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end

    it 'only accepts positive sums' do
      expect{account.deposit(-100)}.to raise_error('You can only deposit positive sums.')
    end

    it 'only accepts numbers to 2 decimal places' do
      expect{ account.deposit(1.111) }.to raise_error('You can only deposit in whole pounds and pence.')
    end

    it 'delegate receives #add_transaction' do
      account.deposit(100)
      expect(mock_transactions).to have_received(:add_transaction).with(100, nil, 100)
    end
  end

  context '#withdraw' do
    before do
      account.deposit(100)
      account.withdraw(10)
    end

    it 'can take money from the account' do
      expect(account.balance).to eq 90
    end

    it "can't go below balance" do
      expect{ account.withdraw(100) }.to raise_error("You can't withdraw more than your balance.")
    end

    it 'only accepts positive sums' do
      expect{ account.withdraw(-100) }.to raise_error('You can only withdraw positive sums.')
    end

    it 'only accepts numbers to 2 decimal places' do
      expect{ account.withdraw(1.111) }.to raise_error('You can only withdraw in whole pounds and pence.')
    end

    it 'delegate receives #add_transaction' do
      expect(mock_transactions).to have_received(:add_transaction).with(nil, 10, 90)
    end
  end

  context '#statement' do
    it 'delegate receives #new' do
      account.statement
      expect(mock_printer_class).to have_received(:new)
    end

    it 'delegate instance receives #print' do
      account.statement
      expect(mock_printer_1).to have_received(:print)
    end
  end
end
