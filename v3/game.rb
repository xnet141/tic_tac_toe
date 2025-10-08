require 'ruby2d'
require_relative 'player'
require_relative 'logic'

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





@game = nil
on :mouse_down do |event| 
  case event.button
  when :left
    if logic.game_start # == true
      player.circle event.x, event.y
      logic.array(event.y,event.x) # переделать = axis(event.x), axis(event.y)
      logic.squares_victory 
      logic.game_over
    end  
  when :right
    close
  end
end


show
