require './lib/pegs'
require './lib/game'
require './lib/placement'
require './lib/game'



peg1 = Pegs.new("yellow", "Y")
peg2 = Pegs.new("red", "r")
peg3 = Pegs.new("blue", "b")
peg4 = Pegs.new("green", "g")
pegs = [peg1, peg2, peg3, peg4]
placement = Placement.new(pegs)
game = Game.new(pegs)
placement.place_peg(pegs)
game.start
