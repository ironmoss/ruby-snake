class Board

  attr_reader :width, :height

  def initialize
    @width = 40
    @height = 25
  end

  def drawBoard(player, bittle)
    border = "="*@width
    body = Array.new(@height) { Array.new(@width, " ") }

    body.each do |row|
      row[0] = "|"
      row[@width - 1] = "|"
    end

    body[bittle.y_coordinate][bittle.x_coordinate] = "$"

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
