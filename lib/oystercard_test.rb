require './oystercard.rb'

p oystercard = Oystercard.new

p oystercard.in_journey?

p oystercard.top_up(10)

p oystercard.touch_in("Aldgate East")

p oystercard.balance

p oystercard.entry_station

p oystercard.touch_out("Whitechapel")

p oystercard.balance

p oystercard.entry_station

oystercard.print_journeys
