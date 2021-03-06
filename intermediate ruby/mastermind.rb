COLORS =  %w{ RED RED RED RED BLU BLU BLU BLU YEL YEL YEL YEL GRE GRE GRE GRE WHI WHI WHI WHI BLA BLA BLA BLA }
class Game

  attr_reader :answer

  def initialize
    @answer = COLORS.shuffle
  end

end

class Play

  def initialize
    @answer = COLORS.shuffle.values_at(0..3)
    @turns = 12
    @attempts = []
    rules
    turn
  end

  def turn
    @turns -= 1
    show_board
    prompt_input
    game_over? || turn
  end

  def game_over?
    puts "your guess was #{@processed_input[0..3]}" #HACK
    puts "the answer was #{@answer}" #HACK
    you_win if @processed_input[(0..3)] == @answer
    @turns == 0 ? you_lose : turn
  end

  def you_lose
    puts "\nGAME OVER."
    play_again?
  end

  def you_win
    puts "\nYOU WIN!"
    play_again?
  end

  def play_again?
    puts "Press any key to play again, ENTER to quit."
    response = gets.chomp
    response == "" ? abort : initialize
  end

  def prompt_input
    puts "\nEnter four colors. Choose from RED, BLUE, YELLOW, GREEN, WHITE, or BLACK."
    @raw_input = gets.chomp
    process_input
    check_input
  end

  def check_input
    check_length
    valid_colors?
    add_keys #Black and white key codes are stored in the array item for each turn
    @attempts.push(@processed_input)
  end

  def add_keys
    for x in (0..3)
      @processed_input.push(" X") if @processed_input[x] == @answer[x]
    end
    for x in (0..3)
      puts @processed_input[x]
      if @answer.include?(@processed_input[x])
        if @processed_input[x] != @answer[x]
          @processed_input.push(" O")
        end
      end
    end
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
    puts ""
    @attempts.each do |attempt|
      puts attempt.join(" ") + " "
    end
    @turns.times do
       puts "xxx xxx xxx xxx"
    end
    puts %q{--- --- --- ---}
    puts %q{  MASTERMIND!  }
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