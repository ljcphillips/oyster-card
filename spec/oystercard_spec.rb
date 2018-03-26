require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it "has a balance" do
    expect(oystercard.balance).to be
  end

  it "responds to top_up" do
    expect(oystercard).to respond_to(:top_up)
  end

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
