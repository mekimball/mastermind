require './lib/pegs'
require './lib/placement'

RSpec.describe Placement do
  it 'exists' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1]
    placement = Placement.new(pegs)
    expect(placement).to be_a(Placement)
  end
  it 'can have pegs' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1]
    placement = Placement.new(pegs)
    expect(placement.pegs).to eq([peg1])
  end

  it 'can place pegs' do
    peg1 = Pegs.new("blue", "B")
    # peg2 = Pegs.new("red", "R")
    # peg3 = Pegs.new(yellow)
    # peg4 = Pegs.new(green)
    pegs = [peg1, peg1, peg1, peg1]
    placement = Placement.new(pegs)
    expect(placement.place_peg(pegs)).to eq([peg1, peg1, peg1, peg1])
  end

  it 'can list pegs' do
    peg1 = Pegs.new("blue", "B")
    # peg2 = Pegs.new(red)
    # peg3 = Pegs.new(yellow)
    # peg4 = Pegs.new(green)
    pegs = [peg1, peg1, peg1, peg1]
    # pegs.shuffle!(random: Random.new(1))
    placement = Placement.new(pegs)
    placement.place_peg(pegs)
    expect(placement.set_details).to eq("bbbb")
  end
end
