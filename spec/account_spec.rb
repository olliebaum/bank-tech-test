require 'account'
require 'timecop'

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
  context '#statement' do
    it 'can print out a deposit transaction' do
      Timecop.freeze(DateTime.now)
      date1 = DateTime.now
      subject.deposit(100)
      statement_str = "date || credit || debit || balance\n" +
        "#{date1} || 100 || || 100\n"
      expect{subject.statement}.to output(statement_str).to_stdout
    end
  end
end
