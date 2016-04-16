module TTT
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
SQUARES = (1..9)
MATRIX = "1|2|3\n4|5|6\n7|8|9"

  class Game
    puts WINS
    puts SQUARES
    puts MATRIX

    def initialize
      @board = (0..9).map{ |i| i = "_"}
      puts "Initialze works!"
      puts "This is the board " + @board.join
      puts "This is how long it is " + @board.length.to_s
      puts "The SQUARES thing is working " + @board[SQUARES].join
      puts "This is how long it is now " + @board[SQUARES].length.to_s
    end

  end

end

TTT::Game.new


 def game_over?
  if @board[1..9]
 end