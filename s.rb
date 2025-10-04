require 'ruby2d'
require_relative 'lib/x'

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

def image x, y 
  Image.new(
    'img.png',
    x: x, y: y,
    width: 140, height: 140,
    color: [3.0, 0.5, 0.2, 1.0],
    rotate: 45,
    z: 10
  )
end

# xxx = X.new
# xxx.show

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  # puts event.x, event.y

  # Read the button event
  case event.button
  when :left 
    puts event.x
    if event.x <= GRID_SIZE && (event.y < GRID_SIZE)
      image 60, 60
    elsif event.x <= GRID_SIZE * 2 && (event.y < GRID_SIZE * 2)
      Image.new(
        'img.png',
        x: 200, y: 200,
        width: 140, height: 140,
        color: [3.0, 0.5, 0.2, 1.0],
        rotate: 45,
        z: 10
      )
    elsif event.x <= GRID_SIZE * 3 && (event.y < GRID_SIZE * 3)
      Image.new(
        'img.png',
        x: 100, y: 100,
        width: 140, height: 140,
        color: [3.0, 0.5, 0.2, 1.0],
        rotate: 45,
        z: 10
      )
    end
  end
end

show