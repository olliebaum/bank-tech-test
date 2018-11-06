require 'transaction_history'
require 'timecop'

describe TransactionHistory do
  context '#add_transaction' do
    before { Timecop.freeze(Date.today) }
    
    it 'stores a transaction' do
      date1 = Date.today.strftime("%d/%m/%Y")
      subject.add_transaction(100, nil, 100)
      expect(subject.list).to eq [{ date: date1, credit: 100, debit: nil, balance: 100 }]
    end
  end
end
