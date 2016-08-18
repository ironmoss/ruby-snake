require_relative 'board'
require_relative 'player'
require_relative 'tailpiece'
require_relative 'item'
require_relative 'bittle'
require_relative 'obstacle'

require 'colorize'

class Game

  attr_reader :board, :player, :bittle, :obstacles

  def initialize

    width = ARGV[0].to_i if ARGV[0]
    height = ARGV[1].to_i if ARGV[1]
    obs = ARGV[2].to_i if ARGV[2]

    width && height ? @board = Board.new(width, height) : @board = Board.new 
    
    @player = Player.new(@board)
    @bittle = Bittle.new(@board)

    @obstacles = []
    if obs
      obs.times do
        @obstacles << Obstacle.new(@board)
      end
    end

    system('clear')

    @board.drawBoard(@player, @bittle, @obstacles)
    play_game
  end

  def play_game
    while @player.is_on_board?(@board) && !@player.hit_something? && !@player.hit_something?(@obstacles)
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

      @player.set_last_position
      @player.move
      @player.move_tail if @player.tail.length > 0

      if @player.got_bittle?(@bittle)
        @player.grow
        @player.speed *= 0.9
        add_bittle
      end

      system('clear')
      @board.drawBoard(@player, @bittle, @obstacles)

    end

    @player.score = calculated_score
    game_over

  end

  def add_bittle
    @bittle = Bittle.new(@board)
    @obstacles.each do |obstacle|
    if obstacle.x_coordinate == @bittle.x_coordinate && obstacle.y_coordinate == @bittle.y_coordinate
      add_bittle
      end
    end
  end

  def calculated_score
    base_points = @player.tail.length * 1000
    obstacle_bonus = @obstacles.length + 1
    board_size_penalty = @board.width + @board.height
    base_points * obstacle_bonus / board_size_penalty
  end

  def game_over
    puts "You collided with the wall and died." if !@player.is_on_board?(@board)
    puts "You collided with your tail and died." if @player.hit_something?
    puts "You collided with an obstacle and died." if @player.hit_something?(@obstacles)
    puts "Your tail has #{@player.tail.length} segments."
    puts "You earned #{@player.score} points."
  end

  def self.getkey
    system('stty raw')
    char = STDIN.read_nonblock(1) rescue nil
    system('stty -raw')
    return char
  end  

end

Game.new
