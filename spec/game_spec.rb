require './lib/pegs'
require './lib/game'
require './lib/placement'

RSpec.describe Game do
  it 'exists' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game).to be_a(Game)
  end

  it 'welcome_message' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.welcome_message).to eq("Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?")
  end

  it 'unsure' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.unsure).to eq("I'm sorry I didn't understand that. Please try again")
  end

  it 'welcome' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.instructions).to eq("The object of MASTERMIND is to guess a secret code consisting of a series of 4
    colored pegs. Each guess results in feedback narrowing down the possibilities of the
    code. Guess all pegs correctly to win the game.")
  end
  it 'choice' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.choice).to eq("Pick 4 colors (\e[34m(b)lue\e[0m, \e[32m(g)reen\e[0m, \e[33m(y)ellow\e[0m, \e[31m(r)ed\e[0m) to guess. They can be repeated, but the order matters. Enter 'q' to quit.")
  end

  it 'add_count' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.guess_count).to eq(0)
    game.add_count
    expect(game.guess_count).to eq(1)
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
