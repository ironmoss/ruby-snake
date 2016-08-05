class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed, :tail

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @last_x = 0
    @last_y = 0
    @speed = 0.5
    @tail = [Tailpiece.new(@x_coordinate, @y_coordinate)]
  end

  def move_up
    @last_y = @y_coordinate
    @y_coordinate -= 1
    move_tail
  end

  def move_down
    @last_y = @y_coordinate
    @y_coordinate += 1
    move_tail
  end

  def move_right
    @last_x = @x_coordinate
    @x_coordinate += 1
    move_tail
  end

  def move_left
    @last_x = @x_coordinate
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
    tail << Tailpiece.new(@last_x, @last_y)
  end

  def move_tail
    @tail.rotate!(-1)
    @tail[0].x_coordinate = @x_coordinate
    @tail[0].y_coordinate = @y_coordinate
  end

  def missed_tail?
    collision = 0
    tailend = @tail.drop(1)
    tailend.each do |segment|
      collision += 1 if segment.x_coordinate == @x_coordinate && segment.y_coordinate == @y_coordinate
    end
    if collision == 0
      return true
    else
      return false
    end
  end

end
