class Game
    attr_reader :peg1,
                :pegs,
                :placement,
                :guess_count,
                :player_guess


  def initialize(pegs)
    @peg1 = Pegs.new("blue", "B")
    @pegs = [peg1, peg1, peg1, peg1]
    @placement = Placement.new(pegs)
    @guess_count = 0
    @player_guess = player_guess
  end

  def start
    puts welcome_message
    start_input
  end

  def welcome_message
    "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def unsure
    "I'm sorry I didn't understand that. Please try again"
  end

  def instructions
    "The object of MASTERMIND is to guess a secret code consisting of a series of 4
    colored pegs. Each guess results in feedback narrowing down the possibilities of the
    code. Guess all pegs correctly to win the game."
  end

  def choice
    "Pick 4 colors (\e[34m(b)lue\e[0m, \e[32m(g)reen\e[0m, \e[33m(y)ellow\e[0m, \e[31m(r)ed\e[0m) to guess. They can be repeated, but the order matters. Enter 'q' to quit."
  end

  def start_input
    input = gets.chomp
    if input.downcase == "p"
      start_game
    elsif input.downcase == "i"
      puts instructions
      start_input
    elsif input.downcase == "q" || "quit"
      exit
    else
      unsure
      start_input
    end
  end

  def start_game
    placement.place_peg(pegs)
    guess
  end

  def guess
    puts choice
    @player_guess = gets.chomp
    add_count
    checks_guess
  end

  def add_count
    @guess_count += 1
  end


  def checks_guess
    # require "pry"; binding.pry
    if @player_guess.downcase == "q" || "quit"
      exit
    elsif @player_guess.downcase == "c" || "cheat"
      puts "#{placement.set_details}"
    elsif @player_guess != placement.set_details
      puts "man you suck"
    else @player_guess == placement.set_details
      puts "you won!"
    end
  end


  #
  #
  #
  #   puts choice
  #   guess = []
  #   guess << gets.chomp.upcase
  #   if guess[0].downcase == "q"
  #     exit
  #   elsif guess.reduce == placement.set_details.join
  #     puts "congrats you won"
  #   else
  #     puts "placeholder"
  #     require "pry"; binding.pry
  #   end

end
