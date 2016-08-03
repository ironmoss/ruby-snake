require_relative 'board'

class Player

  attr_reader :starting_location

  def initialize
    board = Board.new
    board.drawBoard
    @starting_location = [board.width/2, board.height/2]
  end

end

player = Player.new
puts player.starting_location