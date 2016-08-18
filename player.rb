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
      @y_coordinate -= 1
    when "down"
      @y_coordinate += 1
    when "left"
      @x_coordinate -= 1
    when "right"
      @x_coordinate += 1
    end
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

  def hit_something?(threats = @tail)
    collisions = 0
    threats.each do |threat|
      collisions += 1 if threat.x_coordinate == @x_coordinate && threat.y_coordinate == @y_coordinate
    end
    collisions > 0
  end

end
