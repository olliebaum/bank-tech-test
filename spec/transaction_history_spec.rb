require 'transaction_history'
require 'timecop'

describe TransactionHistory do
  context '#add_transaction' do
    before { Timecop.freeze(Date.today) }

    it 'stores a transaction' do
      subject.add_transaction(100, nil, 100)
      expect(subject.list).to eq [{ date: Date.today, credit: 100, debit: nil, balance: 100 }]
    end
  end
end
