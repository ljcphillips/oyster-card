require './oystercard.rb'

p oystercard = Oystercard.new

p oystercard.in_journey?

p oystercard.top_up(10)

p oystercard.touch_in

p oystercard.balance

p oystercard.touch_out

p oystercard.balance
