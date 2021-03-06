require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }
    let(:entry_station) { double :entry_station }
    let(:exit_station) { double :exit_station }

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
      oystercard.send(:deduct, 10)
      expect(oystercard.balance).to eq 40
    end

  end

  describe '#in_journey?' do

    it "expects new instance of oystercard to not be in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it "expects oystercard to be in journey after touching in" do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end

    it "expects oystercard to not be in journey after touching out" do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard).not_to be_in_journey
    end

  end

  describe '#touch_in' do

    it "expects error if touching in with low balance" do
      expect{oystercard.touch_in(entry_station)}.to raise_error
    end

    it "expects oystercard to tell us its entry_station" do
      oystercard.top_up(10)
      oystercard.touch_in("Aldgate East")
      expect(oystercard.entry_station).to eq "Aldgate East"
    end

  end

  describe '#touch_out' do

    it "expects balance to reduce after touching out" do
      expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_FARE)
    end

  end

  describe '#journey_history' do

    it "expects journey_history to be empty by default" do
      expect(oystercard.journey_history).to eq []
    end

    it "expects touching in and out to create one journey" do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey_history).to eq [{:entry=>entry_station, :exit=>exit_station}]
    end

  end
end
