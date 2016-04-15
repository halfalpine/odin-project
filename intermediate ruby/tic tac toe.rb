module TTT
  # Constants
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  MATRIX = "1|2|3\n4|5|6\n7|8|9"
end

class Tournament
  # Tracks the open and closed squares of a game
  attr_reader :board, :current_player_id

  def initialize
  end
end


class Game
end

class Player 
  # Tracks a player's name and score
  attr_accessor :name, :score 

  def initialize(name, score = 0)
    @name = name
    @score = score
  end
end

class Board
end

Game.new
