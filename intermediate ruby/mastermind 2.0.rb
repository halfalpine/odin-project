# MISSSION: User-generated code
# NEXT STEP: computer_turn::computer_guess
# Press ENTER to create the code

module Rules
  COLORS =  %w{ RED# RED RED RED BLU BLU BLU BLU YEL YEL YEL YEL GRE GRE GRE GRE WHI WHI WHI WHI BLA BLA BLA BLA }
  
  def Rules.give_rules
    puts "\nLet's play Mastermind!"
    puts "\nThe Code Pegs are RED, BLUE, YELLOW, GREEN, WHITE, and BLACK."
    puts "\nThe Key Pegs are \"O\" and \"X\". An \"O\" will indicate that a Code Peg is the right color but in the wrong position. An \"X\" will indicate that a Code Peg is in the right of the right color and in the right position."
  end

end

class Game

  include Rules

  def hack
    puts "The answer is #{@answer}"
    puts "The processed input is #{@processed_input}"
    puts "The saved indexes are #{@saved_indexes}"
    puts "The saved colors are #{@saved_colors}"
    puts "Hi"
  end

  def initialize
    puts Rules.give_rules
    @answer = []
    @turns = 12
    @saved_indexes = []
    @saved_colors = []
    pick_sides
  end

  def pick_sides
    puts "Press any key + ENTER to guess the code. Press ENTER to create the code."
    @input = gets.chomp
    quit?
    @input == "" ? user_generated_code : computer_generated_code
  end

  def computer_turn
    @turns -= 1
    computer_guess
    add_keys
    log_attempts
    display_board
    @input = gets.chomp
    quit?
    gave_over? ? computer_end_credits : computer_turn
  end

  def computer_guess
    save_exact_matches
    save_inexact_matches
    hack
    guess_using_inexact
    guess_remaining_spots
  end

  def save_inexact_matches
    temp_answer = @answer
    @saved_indexes.each do |x| #Will this work with 'index'?
      if temp_answer[x] != @processed_input[x]
        if temp_answer.include?(@processed_input[x])
          temp_answer.delete_at(temp_answer.index(@processed_input[x]))
          @saved_colors.push(@processed_input[x])
        end
      end
    end
  end

  def save_exact_matches
    for x in (0..3)
      @saved_indexes.push(x) unless @processed_input[x] == @answer[x]
    end
  end

  def game_over? 
  end

  def computer_end_credits
  end

  def turn 
  end

  def user_generated_code
    prompt_input
    process_input
    check_input
    set_answer
    clear_input
    computer_turn
  end

  def set_answer
    @answer = @processed_input
  end

  def clear_input
    @processed_input = []
  end

  def prompt_input
    puts "\nEnter four colors. Choose from RED, BLUE, YELLOW, GREEN, WHITE, or BLACK."
    @input = gets.chomp
  end

  def process_input
    @processed_input = []
    @input.upcase.split.each do |word| 
      word.gsub(/[,]/, "")
      @processed_input.push(word[0..2].upcase)
    end
    @processed_input
  end

  def check_input
    quit? 
    check_length
    check_colors
  end

  def check_length
    prompt_input unless @processed_input.length == 4
  end

  def check_colors
    prompt_input unless (@processed_input - COLORS).empty?
  end

  def computer_generated_code
    @answer = Rules::COLORS.shuffle.values_at(0..3)

    turn
  end

  def quit?
    abort if @input =~ /^\Q/i
  end

end

Game.new