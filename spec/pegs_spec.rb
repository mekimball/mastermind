require './lib/pegs'

RSpec.describe Pegs do
  it 'exists' do
    peg = Pegs.new("blue", "B")
    expect(peg).to be_a(Pegs)
  end

  it 'has colors' do
    peg1 = Pegs.new("blue", "B")
    peg2 = Pegs.new("red", "R")
    expect(peg1.color).to eq("blue")
    expect(peg2.color).to eq("red")
  end

  it 'has initals' do
    peg1 = Pegs.new("blue", "B")
    peg2 = Pegs.new("red", "R")
    expect(peg1.initial).to eq("B")
    expect(peg2.initial).to eq("R")
  end
end
