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
    @board.drawBoard(@player, @bittle)
    play_game
  end

  def play_game
    while @player.is_on_board?(@board) && !@player.hit_tail?
      input = Game.getkey
      sleep(player.speed)

      case input
      when "w"
        @player.direction = "up"
      when "s"
        @player.direction = "down"
      when "d"
        @player.direction = "right"
      when "a"
        @player.direction = "left"
      end

      @player.move(@player.direction)
      @board.drawBoard(@player, @bittle)

      if @player.got_bittle?(@bittle)
        @player.grow
        @player.speed -= 0.02
        @bittle = Bittle.new(@board)
      end

    end

    puts "You collided with the wall and died." if !@player.is_on_board?(@board)
    puts "You collided with your tail and died." if @player.hit_tail?

  end

  def self.getkey
    system('stty raw -echo')
    char = STDIN.read_nonblock(1) rescue nil
    system('stty -raw echo')
    return char
  end  

end

Game.new
