require_relative 'board'

class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed, :length

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @length = 1
    @speed = 0.2
  end

  def move_player
    @y_coordinate -= 1
  end

  def is_alive?(board)
    @x_coordinate > 0 && @y_coordinate > 0 && @x_coordinate < board.width_with_offset - 1 && @y_coordinate < board.height_with_offset
  end

end
