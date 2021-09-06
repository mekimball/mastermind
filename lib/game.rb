class Game
    attr_reader :peg1,
                :pegs,
                :placement,
                :guess_count,
                :player_guess,
                :g_time,
                :s_time

  def initialize(pegs)
    @peg1 = Pegs.new("yellow", "Y")
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

  def start_game
    placement.place_peg(pegs)
    guess
  end

  def guess
    puts choice
    @player_guess = "yyyy"
    guess_time
    add_count
    checks_guess
  end

  def add_count
    @guess_count += 1
  end


  def checks_guess
    if @player_guess == ("q" || "quit")
      exit
    elsif @player_guess == ("c" || "cheat")
      display_cheat_code
    elsif @player_guess != placement.set_details
      return "It thinks they don't match"
      #if @player_guess.count > 4
      #  puts "Too long"
      #elsif @player_guess.count <4
      #  puts "Too short"
      #else
      #  puts "#{@player_guess} has #{number_correct_elements} of the correct
      #  elements with #{number_in_correct_positions} in the correct positions
        #You've taken #{guess_count} guesses."
      #end
    elsif @player_guess == placement.set_details
      #puts "you won in #{calculate_time} seconds"
      return "@player_guess matches placement.set_details"
    else
      puts "invalid guess, try again"
    end
  end

  def display_cheat_code
    puts "#{placement.set_details}"
    placement.set_details
  end

end
