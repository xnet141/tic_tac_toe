require 'ruby2d'
require_relative 'lib/player'
# require_relative 'lib/logic'
require_relative 'lib/board'

set title: "Hello!"

GRID_SIZE = 200
WIDTH = 3 
HEIGHT = 3
GRID_COLOR = Color.new('#222222')
BLOCK_COLOR = Color.new(['orange', 'yellow', 'green'].sample)

set width: WIDTH * GRID_SIZE
set height: HEIGHT * GRID_SIZE

(0..Window.width).step(GRID_SIZE).each do |x|
  Line.new(x1: x, x2: x, y1: 0, y2: Window.height, width: 2, color: GRID_COLOR, z: 1) # z - слой
end

(0..Window.height).step(GRID_SIZE).each do |y|
  Line.new(y1: y, y2: y, x1: 0, x2: Window.width, width: 2, color: GRID_COLOR, z: 1)
end

# logic = Logic.new
player1 = Player1.new
player2 = Player2.new

on :mouse_down do |event| 
  case event.button
  when :left
    if Board.game_start # == true
      # puts "Begin #{logic.game_start}" # == true
      if player1.turn #&& player2.game_start
        puts "Player1"
        player1.logic event.x, event.y
        # p "End #{logic.game_start}"
        # p "End #{player1.game_start}"
        p "End #{Board.game_start}"
        p "=" * 43
      else #player2.game_start && player1.game_start
        puts "Player2"
        player2.logic event.x, event.y
        # p "End #{logic.game_start}"
        # p "End #{player2.game_start}"
        p "End #{Board.game_start}"
        # logic.game_start = false
        p "=" * 43
      end
    end  
  when :right
    close
  end
end


show
