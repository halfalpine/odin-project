WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
SQUARES = (1..9)
MATRIX = "1|2|3\n4|5|6\n7|8|9\n\n"

class Tournament

  def initialize
    @current_player = 0
    welcome_contestants
  end

  def welcome_contestants 
    puts "\nWelcome! Let's play a game of tic-tac-toe."
    puts "Player 1, you will be X's. Please enter your name."
    @x = get_name
    puts "Player 2, you will be O's. Please enter your name."
    @o = get_name 
    puts "\nWelcome, #{@x.name} and #{@o.name}!"
    @current_player = @x
    @current_game = Game.new 
  end  

  def get_name
    @name = gets.chomp
    unless @name =~ /^[A-Z][a-z]+$/ 
      puts "Did you make a mistake? Try again."
      get_name
    end
    Player.new(@name)
  end

  def overall_score
  end  
end    

class Game
  # Does board need to be an attr_accessor variable?
  # Does the Game need to have a winner attr_accessor variable?
  def initialize
    @board = (0..9).map{ |i| i = "_"}
    turn
  end  
  def turn
    show(@board)
    puts "\nPick a square, #{@current_player.name}."
    #selection = gets.chomp if square_available?
    #Turn decider
    #Print welcome
    #Get input
    game_over? # Add method!
  end  
  def show(board)
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
  def game_over?
  end  
end  
class Player 
  # Tracks a player's name and score
  attr_accessor :name, :score   
  def initialize(name)
    @name = name
    @score = 0
  end
end

Tournament.new






