require_relative 'board'

class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @speed = 0.5
  end

  def move_player
    @x_coordinate -= 1
  end

  def is_alive?
    @x_coordinate > 0
  end

end
