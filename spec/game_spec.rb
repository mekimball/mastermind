require './lib/pegs'
require './lib/game'
require './lib/placement'

RSpec.describe Game do
  it 'exists' do
    game = Game.new#(pegs)
    expect(game).to be_a(Game)
  end

  xit 'starts a game that places pegs' do
    game = Game.new
    peg1 = Pegs.new("blue", "B")
    peg2 = Pegs.new("red", "R")
    peg3 = Pegs.new("yellow", "Y")
    peg4 = Pegs.new("green", "G")
    pegs = [peg1, peg2, peg3, peg4]
    placement = Placement.new(pegs)
    placement.place_peg(pegs)
    pegs_random_1 = placement.pegs
    game.start_game
    expect(pegs_random_1).not_to eq game.pegs
  end

  xit 'records the number of guesses' do
    game = Game.new
    peg1 = Pegs.new("blue", "B")
    peg2 = Pegs.new("red", "R")
    peg3 = Pegs.new("yellow", "Y")
    peg4 = Pegs.new("green", "G")
    pegs = [peg1, peg2, peg3, peg4]
    placement = Placement.new(pegs)
    expect(game.guess_counter).to eq 0
    placement.place_peg(pegs)
    game.start_game
    #execute guess_1
    expect(game.guess_counter).to eq 1
    #execute guess_2
    expect(game.guess_counter).to eq 2
  end

  xit 'records the time of each guess' do
    game = Game.new
    peg1 = Pegs.new("blue", "B")
    peg2 = Pegs.new("red", "R")
    peg3 = Pegs.new("yellow", "Y")
    peg4 = Pegs.new("green", "G")
    pegs = [peg1, peg2, peg3, peg4]
    placement = Placement.new(pegs)
    placement.place_peg(pegs)
    expect(game.guess_time).to eq nil
    game.start_game
    #execute guess_1
    guess_1_time = game.guess_time(1)
    expect(guess_1_time).not_to eq nil
    expect(game.guess_time(1)).to be > 0
    #execute guess_2
    guess_2_time = game.guess_time(2)
    expect(guess_2_time).to be > guess_1_time
  end
end
