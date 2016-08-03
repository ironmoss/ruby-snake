class Bittle

  attr_reader :x_coordinate, :y_coordinate

  def initialize(board)
    @x_coordinate = rand(1..board.width - 2)
    @y_coordinate = rand(0..board.height - 1)
  end

end