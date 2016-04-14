  module TTT

  class Game
    Game < TTT

    def initialize
      empty_board = "1|2|3\n4|5|6\n7|8|9"
      turns
    end

    def turns
      puts empty_board
    end
    
  end
end

include TTT
Game.new