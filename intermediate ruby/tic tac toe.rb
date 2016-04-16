module TTT
  # Constants
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  SQUARES = (1..9)
  MATRIX = "1|2|3\n4|5|6\n7|8|9\n\n"

  class Tournament
    # Tracks each player's score
    def initialize
      welcome_contestants
    end

    def welcome_contestants 
      puts "\nWelcome! Let's play a game of tic-tac-toe."
      puts "Player 1, you will be X's. Please enter your name."
      @x = get_name
      puts "Player 2, you will be O's. Please enter your name."
      @o = get_name 
      puts "\nWelcome, #{@x.name} and #{@o.name}!"
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
    # Should board hold both X's and O's?
    def initialize
      @board = (0..9).map{ |i| i = "_"}
      turn
    end
  
    def turn
      show(@board)
      game_over? # Add method!
    end
  
    def show(board)
      puts "\nHere is the map to the board:"
      puts MATRIX
      puts "Here is the current board"
      puts board[SQUARES] # Fix this later with some kind of block!
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

end

TTT::Tournament.new






