class Board

  attr_reader :width, :height

  def initialize
    @width = 40
    @width_with_offset = @width - 2
    @height = 25
    @height_with_offset = @height - 2
    drawBoard
  end

  def drawBoard
    puts "="*@width
    puts ("|" + " "*(@width_with_offset) + "|" + "\n")*(@height_with_offset)
    puts "="*@width    
  end






end
