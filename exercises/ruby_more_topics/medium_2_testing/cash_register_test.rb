# cash_register_rest.rb

require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(10)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    previous_amount = @cash_register.total_money
    amount_paid = @transaction.amount_paid
    @cash_register.accept_money(@transaction)
    new_amount = @cash_register.total_money

    assert_equal(previous_amount + amount_paid , @cash_register.total_money)
  end

  def test_change
    payment = @transaction.amount_paid
    total_owed = @transaction.item_cost
    assert_equal(payment - total_owed, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do  
      @cash_register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    input = StringIO.new('30\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end
