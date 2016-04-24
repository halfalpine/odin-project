#make sure a valid square has been entered

class Tournament
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  SQUARES = (1..9)
  MATRIX = "1|2|3\n4|5|6\n7|8|9\n\n"

  def initialize
    begin_game
  end

  def begin_game
    puts "Welcome!"
    puts "Who will be \"X\"? Please enter your name."
    name = gets.chomp
    @x = Player.new(name)
    @x.symbol = "X"
    @x.score = 0
    puts "Welcome, #{@x.name}!"
    puts "Who will be \"O\"? Please enter your name."
    name = gets.chomp
    @o = Player.new(name)
    @o.symbol = "O"
    @o.score = 0
    puts "Welcome, #{@o.name}!"
    @current_player = @x 
    @waiting_player = @o
    @last_to_score = @x
    start_over
  end

  def start_over
    @board = (0..9).map{ |i| i = "_"}
    turn
  end

  def turn
    display_board
    puts "\n#{@current_player.name}, pick a square."
    square = gets.to_i
    turn unless @board[square] == "_"
    @board[square] = @current_player.symbol
    display_board #hack
    game_over ? end_game : new_turn
  end

  def end_game
    congratulate_winner
    display_score
    continue?
    winner_goes_first
    start_over
  end

  def winner_goes_first
    @current_player = @last_to_score
    @current_player == @x ? @waiting_player = @o : @waiting_player = @x
    puts "\n#{@current_player.name} will go first."
  end

  def continue?
    puts "\nWould you like to play again? (Y/N)" 
    answer = gets.chomp
    answer == "Y" ? true : abort
  end

  def new_turn
    @current_player, @waiting_player = @waiting_player, @current_player
    turn
  end

  def congratulate_winner
    puts "\n#{@current_player.name} wins. Congratulations!" if win?
    puts "\nIt's a tie." unless win?
  end

  def display_score
    puts "\nSo far, #{@x.name} has won #{@x.score} games, and #{@o.name} has won #{@o.score} games."
  end

  def display_board
    system 'clear'
    puts "\nHere is the map to the board:"
    puts MATRIX
    puts "Here is the current board"
    board_image
  end

  def board_image
    puts "#{@board[1]}|#{@board[2]}|#{@board[3]}\n"
    puts "#{@board[4]}|#{@board[5]}|#{@board[6]}\n"
    puts "#{@board[7]}|#{@board[8]}|#{@board[9]}\n"
  end

  def game_over
    win? || tie?
  end

  def tie?
    @board[1..9].all? {|square| square != "_"}
  end

  def win?
    # Take the @board array and see if any of the wins combination are all X's or O's
    WINS.each do |combo|
      match = []
      combo.each do |index|
        match.push(@board[index])  
      end 
      if match == ["X", "X", "X"] || match == ["O", "O", "O"]
        @last_to_score = @current_player
        @current_player.score += 1
        return true
      end
    end
    false
  end

end

class Player
  
  attr_accessor :symbol, :score
  attr_reader :name

  def initialize(name)
    @name = name
    @symbol
    @score = 0
  end
end

Tournament.new