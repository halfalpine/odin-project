  module TTT

  class Game
    Game < TTT

    def initialize
      @empty_board = "1|2|3\n4|5|6\n7|8|9"
      @changeable_board = (0..9).to_a
      turns
    end

    def turns
      puts "Available spaces:"
      puts @empty_board
      puts ""
      puts "Current board:"
      display_board
    end

    def display_board
      board_readout = ""
      @changeable_board[1..9].each do |square|
        if square.is_a? Numeric
          board_readout += " "
        else board_readout += square
        end

      end
      puts board_readout
    end
    
  end

  class Player

  end
end

include TTT
Game.new