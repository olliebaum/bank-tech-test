require 'account'
require 'timecop'

describe Account do
  before(:each) do
    Timecop.freeze(DateTime.now)
    mock_transaction = double("mock_transaction", add_transaction: nil, list: { date: DateTime.now, amount: 100, balance: 100 })
    subject { Account.new(mock_transaction) }
  end
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
end
