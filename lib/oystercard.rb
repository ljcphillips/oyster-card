class Oystercard

  MAXIMUM_BALANCE = 90
  attr_accessor :balance
  def initialize
    @balance = 0
  end

  def top_up(amount)
    too_high_balance_error if balance_checker(amount)
    @balance += amount
  end

  private

  def too_high_balance_error
    raise "You can not have more than 90 on your card"
  end

  def balance_checker(top_up_amount)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

end
