module TTT
  # Constants
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  SQUARES = (1..9)
  MATRIX = "1|2|3\n4|5|6\n7|8|9"
end

class Tournament
  # Tracks each player's score
  def initialize
  end

  def overall_score
  end

end


class Game
  # Does board need to be an instance variable?
  # Does board need to be in the initialize method?
  # Does board need to be an attr_accessor variable?
  # Should board hold both X's and O's?
  def initialize
    @board = (0..9).to_a # How to populate array with _'s
    @board = (0..9).map{ |i| i = "_"}
  end
end

class Player 
  # Tracks a player's name and score
  attr_accessor :name, :score 

  def initialize(name, score = 0)
    @name = name
    @score = score
  end
end

Game.new

 def game_over?
  if @board[1..9]
 end