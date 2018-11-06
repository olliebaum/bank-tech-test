require 'transaction_history'

describe TransactionHistory do
  context '#add_transaction' do
    it 'stores a transaction' do
      date1 = DateTime.now
      subject.add_transaction(date1, 100, nil, 100)
      expect(subject.list).to eq [{date: date1, credit: 100, debit:nil, balance: 100}]
    end
  end
end
