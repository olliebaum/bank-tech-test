require 'account'

describe Account do
  it 'has a starting balance of 0' do
    expect(subject.balance).to eq 0
  end
  context '#deposit' do
    it 'can add money to the account' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end
  end
end
