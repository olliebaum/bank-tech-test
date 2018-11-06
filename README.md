# Bank Tech Test

Practice tech test for week 10, Makers Academy

# Tech used
- Written with ruby.
- Using Rspec to test.
- Linted with Rubocop.
- Used Timecop gem to mock time.

# Approach
- I have separated into three classes:
  - `Account`
  - `TransactionHistory`
  - `StatementPrinter`

  My implementation raises errors for:
  - Negative deposits + withdrawals
  - Users trying to overdraw their balance
  - Withdrawal or deposit sums with more than 2 decimal places

# How to run
```
# Clone this project
git clone https://github.com/olliebaum/bank-tech-test

# Navigate to the directory
cd bank-tech-test

# Install dependencies
bundle install

# Open 'irb' or 'pry' in the terminal...
irb

# ...and require necessary files
require './lib/account'
require './lib/transaction_history'
require './lib/statement_printer'

# Create a new Account
account = Account.new

# Deposit and withdraw money
account.deposit(1000)
account.withdraw(300)

#
account.statement
=>
date || credit || debit || balance
14/01/2012 || || 300.00 || 700.00
10/01/2012 || 1000.00 || || 1000.00
```
