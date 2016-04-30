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
    puts "Hi"
  end

  def initialize
    puts Rules.give_rules
    @answer = []
    @turns = 12
    pick_sides
  end

  def pick_sides
    puts "Press any key + ENTER to guess the code. Press ENTER to create the code."
    @input = gets.chomp
    quit?
    @input == "" ? computer_generated_code : user_generated_code
  end

  def computer_turn
  end

  def turn 
  end

  def user_generated_code
    prompt_input
    process_input
    check_input
    computer_turn
  end

  def prompt_input
    puts "\nEnter four colors. Choose from RED, BLUE, YELLOW, GREEN, WHITE, or BLACK."
    @input = gets.chomp
  end

  def process_input
    @processed_input = []
    @raw_input.upcase.split.each do |word| 
      word.gsub(/[,]/, "")
      @processed_input.push(word[0..2].upcase)
    end
    @processed_input
  end

  def check_input
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