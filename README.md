# Bank Tech Test

Practice tech test for week 10, Makers Academy

## Tech used
- Written with ruby.
- Using Rspec to test.
- Linted with Rubocop.
- Used Timecop gem to mock time.

## Approach
- I have separated into three classes:
  - `Account`
  - `TransactionHistory`

  My implementation raises errors for:
  - Negative deposits + withdrawals
  - Users trying to overdraw their balance
  - Withdrawal or deposit sums with more than 2 decimal places

## How to install
Clone this project
`git clone https://github.com/olliebaum/bank-tech-test`

Navigate to the directory
`cd bank-tech-test`

Install dependencies
- If you haven't got [bundler](bundler.io) installed, run:
```
gem install bundler
bundle install
```
- Otherwise, just run:
`bundle install`

## Running tests
Assuming you followed the steps in `How to install` above:

To run the tests and see coverage:
`rspec`

To see detailed coverage:
`open coverage/index.html`

To run the linter:
`rubocop`

# How to run
Open 'irb' or 'pry' in the terminal...
`irb`

...and require necessary files
```
require './lib/account'
require './lib/transaction_history'
```

Create a new Account
`account = Account.new`

Deposit and withdraw money
```
account.deposit(1000)
account.withdraw(300)
```

Print a statement
```
account.statement
=>
date || credit || debit || balance
07/01/2018 ||  || 300.00 || 700.00
01/01/2018 || 1000.00 ||  || 1000.00
```
