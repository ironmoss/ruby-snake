class Board

  attr_reader :width, :width_with_offset, :height, :height_with_offset

  def initialize
    @width = 40
    @width_with_offset = @width - 2
    @height = 25
    @height_with_offset = @height - 2
  end

  def drawBoard(player)
    border = "="*@width
    body = Array.new(@height) { Array.new(@width, " ") }

    body.each do |row|
      row[0] = "|"
      row[@width - 1] = "|"
    end

    body[player.y_coordinate][player.x_coordinate] = "@"

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

