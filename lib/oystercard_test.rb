require './oystercard.rb'

p oystercard = Oystercard.new

p oystercard.journey_history == []

sleep 10

p oystercard.in_journey?

p oystercard.top_up(10)

p oystercard.touch_in("Aldgate East")

p oystercard.balance

p oystercard.entry_station

p oystercard.touch_out("Whitechapel")

p oystercard.balance

p oystercard.entry_station




p oystercard.touch_in("Oxford Circus")


p oystercard.touch_out("Finsbury Park")



p oystercard.touch_in("Aldgate")

p oystercard.touch_out("Bow Road")


print oystercard.print_journeys
