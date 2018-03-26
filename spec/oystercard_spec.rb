require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it "has a balance" do
    expect(oystercard.balance).to be
  end
end
