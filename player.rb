class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed, :length, :tail

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @speed = 0.2
    @length = 1
    @tail = []
  end

  def move_up
    @y_coordinate -= 1
    move_tail
  end

  def move_down
    @y_coordinate += 1
    move_tail
  end

  def move_right
    @x_coordinate += 1
    move_tail
  end

  def move_left
    @x_coordinate -= 1
    move_tail
  end  

  def is_on_board?(board)
    @x_coordinate >= 1 && @y_coordinate >= 0 && @x_coordinate < board.width - 1 && @y_coordinate < board.height
  end

  def got_bittle?(bittle)
    @x_coordinate == bittle.x_coordinate && @y_coordinate == bittle.y_coordinate
  end

  def grow
    @length += 1
    tail << Tailpiece.new(@x_coordinate, @y_coordinate)
  end

  def move_tail

  end

end
