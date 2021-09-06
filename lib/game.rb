class Game
    attr_reader :peg1,
                :pegs,
                :placement,
                :guess_count,
                :player_guess,
                :g_time,
                :s_time

  def initialize(pegs)
    @peg1 = Pegs.new("blue", "B")
    @pegs = [peg1, peg1, peg1, peg1]
    @placement = Placement.new(pegs)
    @guess_count = 0
    @player_guess = player_guess
    @g_time = g_time
    @s_time = s_time
  end

  def start
    puts welcome_message
    start_time
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

  def start_time
    @s_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def guess_time
    @g_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def calculate_time
    (@g_time - @s_time).round(2)
  end

  def start_input
    input = gets.chomp
    if input.downcase == "p"
      start_game
    elsif input.downcase == "i"
      puts instructions
      start_input
    elsif input.downcase == ("q" || "quit")
      exit
    else
      unsure
      start_input
    end
  end

  def place_pegs
    placement.place_peg(pegs)
  end

  def start_game
    place_pegs
    guess
  end

  def guess
    puts choice
    @player_guess = gets.chomp.split("")
    guess_time
    add_count
    checks_guess
    @guess_array
  end

  def add_count
    @guess_count += 1
  end


  def checks_guess
    if @player_guess == ("q" || "quit")
      exit
    elsif @player_guess == ("c" || "cheat")
      puts "#{placement.set_details}"
    elsif @player_guess != placement.set_details
      # placement_check
      puts "man you suck"
    else @player_guess == placement.set_details
       puts "you won in #{calculate_time} seconds"
    end
  end

  def correct_place_number
    # require "pry"; binding.pry
    @placement.set_details.zip(@player_guess).filter_map do |first, second|
      first if first == second
    end.count
  end


  # def placement_check
  #   require "pry"; binding.pry
  #   if @guess_array.length != 4
  #     puts "That is not a valid guess, please try again"
  #   elsif @guess_array.includes?('b')
  #
  #   end
  # end
end
