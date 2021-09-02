require './lib/pegs'
require './lib/game'
require './lib/placement'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_a(Game)
  end

  xit 'starts' do
    game = Game.new
    game.start
    #expect(game).to be_a(Game)
  end

  it 'starts a game that places pegs' do
    game = Game.new
    game.start_game
    #expect(game)
  end
end
