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
    puts @answer
  end

  def initialize
    puts Rules.give_rules
    @answer = []
    pick_sides
  end

  def pick_sides
    puts "Press ENTER to create a code. Press any key + ENTER to guess the code."
    @input = gets.chomp
    quit?
    @input == "" ? user_generated_code : computer_generated_code
  end

  def turn 
  end

  def user_generated_code
  end

  def computer_generated_code
    @answer = Rules::COLORS.shuffle.values_at(0..3)
    hack
    turn
  end

  def quit?
    abort if @input =~ /^\Q/i
  end

end

Game.new