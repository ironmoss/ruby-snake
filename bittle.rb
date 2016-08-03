class Bittle

  attr_reader :x_coordinate, :y_coordinate

  def initialize(board)
    @x_coordinate = rand(1..board.width_with_offset)
    @y_coordinate = rand(1..board.height_with_offset)
  end

end