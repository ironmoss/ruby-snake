class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed, :length, :tail

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @speed = 0.2
    @length = 1
    @tail = [Tailpiece.new(@x_coordinate, @y_coordinate)]
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
    @tail.rotate!(-1)
    @tail[0].x_coordinate = @x_coordinate
    @tail[0].y_coordinate = @y_coordinate
  end

  # def missed_tail?
  #   @tail.each do |segment|
  #     if segment.x_coordinate == @x_coordinate && segment.y_coordinate == @y_coordinate
  #       return false
  #     else
  #       return true
  #     end
  #   end
  # end

end
