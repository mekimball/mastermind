require './lib/pegs'
require './lib/game'
require './lib/placement'

RSpec.describe Game do
  it 'exists' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    #placement = Placement.new(pegs)
    game = Game.new(pegs)
    expect(game).to be_a(Game)
  end

  it 'starts' do

    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    #placement = Placement.new(pegs)
    game = Game.new(pegs)
    game.start
    expect(game.welcome_message).to eq "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  xit 'starts a game that places pegs' do
    game = Game.new
    game.start_game
    #expect(game)
  end
end
