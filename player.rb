require_relative 'board'

class Player

  attr_accessor :x_coordinate, :y_coordinate

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
  end

  def move_player
    @x_coordinate -= 1
  end

end
