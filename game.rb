require_relative 'keypress'
require_relative 'board'
require_relative 'player'
require_relative 'bittle'
require_relative 'tailpiece'

class Game

  attr_reader :board, :player, :bittle

  def initialize
    @board = Board.new
    @player = Player.new(@board)
    @bittle = Bittle.new(@board)
    play_game
  end

  def play_game
    while @player.is_on_board?(@board)
      board.drawBoard(@player, @bittle)
      STDIN.echo = false
      input = STDIN.getc.chr

      case input
      when "w"
        @player.move_up
      when "s"
        @player.move_down
      when "d"
        @player.move_right
      when "a"
        @player.move_left
      end

      @player.move_tail

      if @player.got_bittle?(@bittle)
        @player.grow
        @bittle = Bittle.new(@board)
      end

    end

    puts "You collided with the wall and died." if !@player.is_on_board?(@board)
    puts "You collided with yourself and died." if !@player.missed_tail?

  end

end

game = Game.new
