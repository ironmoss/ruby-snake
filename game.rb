require_relative 'board'
require_relative 'player'
require_relative 'tailpiece'
require_relative 'bittle'
require_relative 'obstacle'

class Game

  attr_reader :board, :player, :bittle, :obstacles

  def initialize

    ARGV.length >= 2 ? @board = Board.new(ARGV[0].to_i, ARGV[1].to_i) : @board = Board.new 
    
    @player = Player.new(@board)
    @bittle = Bittle.new(@board)

    @obstacles = []
    if ARGV.length > 2
      ARGV[2].to_i.times do
        @obstacles << Obstacle.new(@board)
      end
    end

    @board.drawBoard(@player, @bittle, @obstacles)
    play_game
  end

  def play_game
    while @player.is_on_board?(@board) && !@player.hit_tail? && !@player.hit_obstacle?(@obstacles)
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
      @board.drawBoard(@player, @bittle, @obstacles)

      if @player.got_bittle?(@bittle)
        @player.grow
        @player.speed *= 0.9
        @bittle = Bittle.new(@board)
      end

    end

    puts "You collided with the wall and died." if !@player.is_on_board?(@board)
    puts "You collided with your tail and died." if @player.hit_tail?
    puts "You collided with an obstacle and died." if @player.hit_obstacle?(@obstacles)

  end

  def self.getkey
    system('stty raw -echo')
    char = STDIN.read_nonblock(1) rescue nil
    system('stty -raw echo')
    return char
  end  

end

Game.new
