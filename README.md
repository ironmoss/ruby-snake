**SNAKE - THE CLASSIC GAME**  
============================

*(aka Nibbler)*  

**Description**

This is an ASCII-based recreation of the classic computer and feature phone game of reflexes and planning.  Move your snake around the play area, eat food to grow and increase the pace of the game, but don't strike your tail, the walls or any obstacles or it's game over.

SNAKE is written in Ruby and can be launched and played from your terminal:
  
  >> ruby game.rb X Y Z

  X = width of play area  
  Y = height of play area  
  Z = number of obstacles  

Command-line arguments are optional.  If none are provided, the game will start with a default play area size and no obstacles.

**Symbols**

Symbols and their meaning are as follows:
  
  "&" = player  
  "@" = tailpiece  
  "$" = food  
  "#" = obstacle  
  "=" = top/bottom border  
  "|" = left/right border  

**Movement**

Once the game begins, the player will immediately begin moving to the left.  Controls for changing direction are as follows:

  w = move up  
  a = move left  
  s = move down  
  d = move right  

Colliding with any walls ends the game.

**Food**

Food appears in random locations.  Eating food increases the length and speed of the player.

**Tailpiece**

The player grows an additional tailpiece each time it eats.  Colliding with a tailpiece ends the game.

**Obstacles**

Obstacles appear in random locations.  Colliding with an obstacle ends the game.
