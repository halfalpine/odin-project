#Code: One is 

class Game

  COLORS =  %w{ RED, BLUE< YELLOW, GREEN, WHITE, BLACK }

  attr_reader :answer

  def initialize
    @answer = Array.new(4) { rand(0..5) }
  end

end

class Play

  def initialize
    @answer = Game.new.hack
    @turns = 12
    @attempts = []
    rules
    turn
  end

  def turn
    show_board
    # update_guesses
    # prompt_input
  end

  def show_board
    
  end

  def rules
    rules = []
    rules.push("Let's play Mastermind!")
    rules.push("The Code Pegs are RED, BLUE, YELLOW, GREEN, WHITE, and BLACK.")
    rules.push("The Key Pegs are WHITE and BLACK. A WHITE Key Peg will indicate that a Code Peg is the right color but in the wrong position. A BLACK Code Peg will indicate that a Code Peg is in the right of the right color and in the right position.")
    rules.each { |rule| puts "\n#{rule}"}
    puts ""
  end

end

Play.new