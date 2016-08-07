class Board

  attr_reader :width, :height

  def initialize(width = 40, height = 25)
    @width = width + 2
    @height = height
  end

  def drawBoard(player, bittle, obstacles = nil)
    border = "="*@width
    body = Array.new(@height) { Array.new(@width, " ") }

    body.each do |row|
      row[0] = "|"
      row[@width - 1] = "|"
    end

    body[player.y_coordinate][player.x_coordinate] = "&"
    body[bittle.y_coordinate][bittle.x_coordinate] = "$"

    if obstacles
      obstacles.each do |obstacle|
        body[obstacle.y_coordinate][obstacle.x_coordinate] = "#"
      end    
    end

    player.tail.each do |segment|
      body[segment.y_coordinate][segment.x_coordinate] = "@"
    end

    puts border
    body.each do |row|
      row.each do |elem|
        print elem
      end
      print "\n"
    end
    puts border
  end

end
