COLORS =  %w{ RED BLU YEL GRE WHI BLA }
class Game

  attr_reader :answer

  def initialize
    @answer = Array.new(4) { rand(0..5) }
  end

end

class Play

  def initialize
    @answer = Game.new.answer
    @turns = 12
    @attempts = []
    rules
    turn
  end

  def turn
    show_board
    # update_guesses
    prompt_input
  end

  def prompt_input
    puts "\nEnter four colors. Choose from RED, BLUE, YELLOW, GREEN, WHITE, or BLACK."
    @raw_input = gets.chomp
    process_input
    check_input
    puts "Input is valid!" #hack
  end

  def check_input
    check_length
    valid_colors?
  end

  def valid_colors?
    prompt_input unless (@processed_input - COLORS).empty?
  end

  def check_length
    prompt_input unless @processed_input.length == 4
  end

  def process_input
    @processed_input = []
    @raw_input.upcase.split.each do |word| 
      word.gsub(/[,]/, "")
      @processed_input.push(word[0..2].upcase)
    end
    @processed_input
  end

  def show_board
    #show_attempts
    @turns.times do
       puts "xxx xxx xxx xxx"
    end
    puts %q{--- --- --- ---}
    puts %q{  MASTERMIND!  }
  end

  def show_attempts
    @attempts.each do |attempt|
      #attempt is an array of four color codes
    end
  end

  def rules
    rules = []
    rules.push("Let's play Mastermind!")
    rules.push("The Code Pegs are RED, BLUE, YELLOW, GREEN, WHITE, and BLACK.")
    rules.push("The Key Pegs are \"O\" and \"X\". An \"O\" will indicate that a Code Peg is the right color but in the wrong position. An \"X\" will indicate that a Code Peg is in the right of the right color and in the right position.")
    rules.each { |rule| puts "\n#{rule}"}
    puts ""
  end

end

Play.new