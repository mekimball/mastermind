require './lib/pegs'
require './lib/game'
require './lib/placement'
require './lib/game'



peg1 = Pegs.new("blue", "B")
pegs = [peg1, peg1, peg1, peg1]
placement = Placement.new(pegs)
game = Game.new(peg1)
placement.place_peg(pegs)
game.start
