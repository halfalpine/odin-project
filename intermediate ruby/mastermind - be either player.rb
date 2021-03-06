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
    add_keys #Black and white key codes are stored in the array item for each turn
    @attempts.push(@processed_input)
    game_over? || turn
  end

  def game_over?
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
    quit?
    process_input
    check_input
  end

  def quit?
    abort if @raw_input =~ /^[Q]/i
  end

  def check_input
    check_length
    valid_colors?
  end

  def add_keys
    for x in (0..3)
      @processed_input.push(" X") if @processed_input[x] == @answer[x]
    end
    for x in (0..3)
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
    which_player
  end

  def which_player
    puts "\nWhich role would you like to play?"
    puts "Press any key to guess the code. Press ENTER to be the code-maker."
    response = gets.chomp
    response == "" ? create_code : turn
  end

  def create_code
    prompt_input
    process_input
    @answer = @processed_input
    @processed_input = COLORS.shuffle.values_at(0..3) # Do this so that first computer guess is not correct!
    @saved_indexes = []
    @saved_colors = []
    computer_turn
  end

  def computer_turn
    @turns -= 1
    computer_guess
    add_keys
    @attempts.push(@processed_input)
    show_board
    @raw_input = gets.chomp
    quit?
    computer_game_over? || computer_turn
  end

  def computer_guess
    puts "the current guess is #{@processed_input}" #HACK
    save_exact_matches
    save_inexact_matches
    guess_using_inexact
    guess_clueless_spots
  end

  def guess_clueless_spots
    puts "saved_indexes are #{@saved_indexes}"
    @saved_indexes.each do |x|
      @processed_input[x] = COLORS.shuffle[0]
    end
    @processed_input
  end

  def guess_using_inexact
    @saved_colors.shuffle!
    @saved_colors.length.times do
      x = @saved_indexes.pop
      @processed_input[x] = @saved_colors.pop
    end
    puts "used all the colors!" if @saved_colors.length == 0
    puts "processed_input = #{@processed_input}"
  end

  def save_inexact_matches
    @saved_colors = []
    temp_answer = @answer
    @saved_indexes.each do |x| #Will this work with 'index'?
      if temp_answer[x] != @processed_input[x]
        if temp_answer.include?(@processed_input[x])
          temp_answer.delete_at(temp_answer.index(@processed_input[x]))
          @saved_colors.push(@processed_input[x])
        end
      end
    end
    puts "the inexact matches are #{@saved_colors.join(" and ")}"
  end

  def save_exact_matches
    for x in (0..3)
      @saved_indexes.push(x) unless @processed_input[x] == @answer[x]
      puts "the saved_indexes are #{@saved_indexes.join(" ")}"
    end
  end

  def computer_game_over?
    you_lose if @processed_input[(0..3)] == @answer
    @turns == 0 ? you_win : computer_turn 
  end

end

Play.new