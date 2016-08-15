class Player

  attr_accessor :x_coordinate, :y_coordinate, :speed, :direction, :tail

  def initialize(board)
    @x_coordinate = board.width/2
    @y_coordinate = board.height/2
    @last_x = 0
    @last_y = 0
    @speed = 0.5
    @direction = "left"
    @tail = []
  end

  def move
    case self.direction
    when "up"
      move_up
    when "down"
      move_down
    when "left"
      move_left
    when "right"
      move_right
    end
  end

  def move_up
    @y_coordinate -= 1
  end

  def move_down
    @y_coordinate += 1
  end

  def move_right
    @x_coordinate += 1
  end

  def move_left
    @x_coordinate -= 1
  end

  def set_last_position
    @last_x = x_coordinate
    @last_y = y_coordinate
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
    @tail[0].x_coordinate = @last_x
    @tail[0].y_coordinate = @last_y
  end

  def hit_tail?
    collisions = 0
    @tail.each do |segment|
      collisions += 1 if segment.x_coordinate == @x_coordinate && segment.y_coordinate == @y_coordinate
    end
    collisions > 0
  end

  def hit_obstacle?(obstacles)
    collisions = 0
    obstacles.each do |obstacle|
      collisions += 1 if obstacle.x_coordinate == @x_coordinate && obstacle.y_coordinate == @y_coordinate
    end
    collisions > 0
  end

end
