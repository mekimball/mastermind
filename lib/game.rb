class Game
    attr_reader :peg1,
                :peg2,
                :peg3,
                :peg4,
                :pegs,
                :placement,
                :guess_count,
                :player_guess,
                :g_time,
                :s_time

  def initialize(pegs)
    @peg1 = Pegs.new("yellow", "Y")
    @peg2 = Pegs.new("red", "r")
    @peg3 = Pegs.new("blue", "b")
    @peg4 = Pegs.new("green", "g")
    @pegs = [peg1, peg2, peg3, peg4]
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
      puts welcome_message
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
    checks_guess
  end

  def add_count
    @guess_count += 1
  end

  def end_game
    puts "Congratulations! You guessed the sequence #{placement.set_details} in #{@guess_count} guesses over #{calculate_time} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
    @placement = Placement.new(pegs)
    @guess_count = 0
    start_time
    start_input
  end

  def guess_message
    add_count
    puts "#{@player_guess} has #{correct_colors} correct elements with #{correct_place_number} in the correct positions."
    puts "You have taken #{@guess_count} guesses"
    guess
  end

  def checks_guess
    if @player_guess == ["q"] || @player_guess == ["q", "u", "i", "t"]
      exit
    elsif @player_guess == ["c"] || @player_guess == ["c", "h", "e", "a", "t"]
      display_cheat_code
      guess
    elsif @player_guess.count < 4
      puts "That is too short, try again"
      guess
    elsif @player_guess.count > 4
      puts "That is too long, try again"
      guess
    elsif valid_guess > 4
      puts "That is not a valid guess. Please try again"
      guess
    elsif @player_guess == placement.set_details
      add_count
      end_game
    else
      guess_message
    end
  end

  def display_cheat_code
    puts "#{placement.set_details}"
    placement.set_details
  end

  def valid_guess
    total = (["y", "g", "r", "b"] + @player_guess)
    total.uniq.count
  end

  def correct_place_number
    @placement.set_details.zip(@player_guess).filter_map do |first, second|
      first if first == second
    end.count
  end

  def correct_colors
    color_correct = []
    color_correct << @player_guess
    color_correct.flatten!
    placement.set_details.each do |color|
      color_correct.delete_at(color_correct.index(color)) rescue ""
    end
    4 - color_correct.length
  end
end
