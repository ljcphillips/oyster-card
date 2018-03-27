require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#top_up' do
    it "adds funds when topping up" do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end


    it "errors when too much money" do
      message = "You can not have more than 90 on your card"
      oystercard.balance = 90
      expect { oystercard.top_up(1) }.to raise_error message
    end
  end

  describe '#deduct' do

    it "deducts from the balance" do
      oystercard.balance = 50
      oystercard.deduct(10)
      expect(oystercard.balance).to eq 40

    end

  end

  describe '#in_journey?' do

    it "expects new instance of oystercard to not be in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it "expects oystercard to be in journey after touching in" do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it "expects oystercard to not be in journey after touching out" do
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard).not_to be_in_journey
    end

  end

end
