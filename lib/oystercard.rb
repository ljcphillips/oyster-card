class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_accessor :balance
  attr_accessor :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    too_high_balance_error if balance_too_high(amount)
    @balance += amount
  end

  def in_journey?
    !!@entry_station 
  end

  def touch_in(entry_station)
    too_low_balance_error if balance_too_low
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def too_high_balance_error
    raise "You can not have more than 90 on your card"
  end

  def too_low_balance_error
    raise "You do not have enough money on your card to make a journey"
  end

  def balance_too_high(top_up_amount = 0)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

  def balance_too_low
    @balance < MINIMUM_BALANCE
  end

end
