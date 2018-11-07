require 'timecop'

describe 'User creates an account' do
  Timecop.freeze(Date.today)
  date_str = Date.today.strftime("%d/%m/%Y")
  subject(:account) { Account.new }

  context 'when they deposit £100' do
    before { account.deposit(100) }

    it 'it deposits £100' do
      expect(account.balance).to eq 100
    end

    context 'then withdraw £10' do
      before { account.withdraw(10) }

      it 'it withdraws £10' do
        expect(account.balance).to eq 90
      end

      it 'prints their statement correctly' do
        statement_str = "date || credit || debit || balance\n" +
                        "#{date_str} ||  || 10.00 || 90.00\n" +
                        "#{date_str} || 100.00 ||  || 100.00\n"
        expect{account.statement}.to output(statement_str).to_stdout
      end
    end
  end
end
