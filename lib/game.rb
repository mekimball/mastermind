class Game
    attr_reader :peg1,
                :pegs,
                :placement


  def initialize
    @peg1 = Pegs.new("blue", "B")
    @pegs = [peg1, peg1, peg1, peg1]
    @placement = Placement.new(pegs)

  end

  def start
    puts "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    input = gets.chomp
    if input.downcase == "p"
      start_game
    elsif input.downcase == "i"
      puts "\n"
      puts instructions
      puts "\n"
      start
    elsif input.downcase == "q"
      exit
    else
      puts "I'm sorry I didn't understand that. Please try again"
      puts "\n"
      start
    end
  end

  def instructions
    "The object of MASTERMIND is to guess a secret code consisting of a series of 4
    colored pegs. Each guess results in feedback narrowing down the possibilities of the
    code. Guess all pegs correctly to win the game."
  end

  def start_game
    placement.place_peg(pegs)
    require "pry"; binding.pry
  end

end
