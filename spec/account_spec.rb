require 'account'

describe Account do
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
