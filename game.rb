require_relative 'keypress'
require_relative 'board'
require_relative 'player'
require_relative 'bittle'

# class Game

  # def initialize

  # end

# end

board = Board.new
player = Player.new(board)
bittle = Bittle.new(board)

board.drawBoard(player, bittle)

while player.is_on_board?(board)
  STDIN.echo = false
  input = STDIN.getc.chr

  case input
  when "w"
    player.move_up
    board.drawBoard(player, bittle)
  when "s"
    player.move_down
    board.drawBoard(player, bittle)
  when "d"
    player.move_right
    board.drawBoard(player, bittle)
  when "a"
    player.move_left
    board.drawBoard(player, bittle)
  end
end

puts "You collided with the wall and died."