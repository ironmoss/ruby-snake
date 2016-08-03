require_relative 'keypress'
require_relative 'board'
require_relative 'player'

# class Game

  # def initialize

  # end

# end

board = Board.new
player = Player.new(board)

board.drawBoard(player)

while player.is_on_board?(board)
  STDIN.echo = false
  input = STDIN.getc.chr

  case input
  when "w"
    player.move_up
    board.drawBoard(player)
  when "s"
    player.move_down
    board.drawBoard(player)
  when "d"
    player.move_right
    board.drawBoard(player)
  when "a"
    player.move_left
    board.drawBoard(player)
  end
end

puts "You collided with the wall and died."