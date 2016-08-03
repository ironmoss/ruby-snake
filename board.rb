require_relative 'player'

class Board

  attr_reader :width, :height

  def initialize
    @width = 40
    @width_with_offset = @width - 2
    @height = 25
    @height_with_offset = @height - 2
  end

  def drawBoard(player)
    puts "="*@width
    puts ("|" + " "*@width_with_offset + "|" + "\n")*player.y_coordinate
    puts ("|" + " "*player.x_coordinate + "@" + " "*(@width_with_offset - player.x_coordinate - player.length) + "|" + "\n")
    puts ("|" + " "*@width_with_offset + "|" + "\n")*(@height_with_offset - player.y_coordinate)
    puts "="*@width
  end


end