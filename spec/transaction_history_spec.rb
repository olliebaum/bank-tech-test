require 'transaction_history'

describe TransactionHistory do
  context '#add_transaction' do
    it 'stores a transaction' do
      date1 = DateTime.now
      subject.add_transaction(date1, 100, 100)
      expect(subject.list).to eq [{date: date1, amount: 100, balance: 100}]
    end
  end
end
