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
    peg1 = Pegs.new("blue", "b")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    expect(game.welcome_message).to eq("Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?")
  end

  it 'unsure' do
    peg1 = Pegs.new("blue", "b")
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

  it 'records the time of a guess' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    game.start_time
    sleep(0.5)
    game.guess_time
    guess_1_time = game.calculate_time
    sleep(0.5)
    game.guess_time
    guess_2_time = game.calculate_time
    expect(guess_1_time).to be_within(0.1).of(0.50)
    expect(guess_2_time).to be_within(0.1).of(1.00)
  end

  it 'checks a guess' do
    peg1 = Pegs.new("yellow", "Y")
    peg2 = Pegs.new("yellow", "Y")
    peg3 = Pegs.new("yellow", "Y")
    peg4 = Pegs.new("yellow", "Y")
    pegs = [peg1, peg2, peg3, peg4]
    game = Game.new(pegs)
    placement = Placement.new(pegs)
    placement.place_peg(pegs)
    placement_details = placement.set_details
    game.start_game
    @player_guess = ["y", "y", "y", "y"]
    expect(game.checks_guess).to eq "@player_guess matches placement.set_details"
  end

  it 'has a cheat option' do
    peg1 = Pegs.new("yellow", "Y")
    peg2 = Pegs.new("yellow", "Y")
    peg3 = Pegs.new("yellow", "Y")
    peg4 = Pegs.new("yellow", "Y")
    pegs = [peg1, peg2, peg3, peg4]
    game = Game.new(pegs)
    placement = Placement.new(pegs)
    placement.place_peg(pegs)
    placement_details = placement.set_details
    game.start_game
    expect(game.display_cheat_code).to eq(placement_details)
  end

  xit 'checks a guess' do
   peg1 = Pegs.new("yellow", "Y")
   peg2 = Pegs.new("yellow", "Y")
   peg3 = Pegs.new("yellow", "Y")
   peg4 = Pegs.new("yellow", "Y")
   pegs = [peg1, peg2, peg3, peg4]
   game = Game.new(pegs)
   placement = Placement.new(pegs)
   placement.place_peg(pegs)
   placement_details = placement.set_details
   @player_guess = "yyyy"
   expect(game.checks_guess).to eq("you won")
   @player_guess = "bbbb"
   expect(game.checks_guess).to eq("man you suck")
 end

  xit 'correct_place_number' do
    peg1 = Pegs.new("blue", "B")
    pegs = [peg1, peg1, peg1, peg1]
    game = Game.new(pegs)
    placement = Placement.new(pegs)
    @player_guess = ["b", "b", "y", "g"]
    game.place_pegs
    expect(game.correct_place_number).to eq(2)
  end
end
