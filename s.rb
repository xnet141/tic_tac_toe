require 'ruby2d'

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

Circle.new(
  x: GRID_SIZE/2, y: GRID_SIZE/2,
  radius: 75,
  sectors: 32,
  color: 'fuchsia',
  z: 10
)

(0...3).each do |x|
  Image.new(
    'img.png',
    x: GRID_SIZE * (x + 0.5) - 70, y: GRID_SIZE * 2.5 - 70,
    width: 140, height: 140,
    color: [3.0, 0.5, 0.2, 1.0],
    rotate: 45,
    z: 10
  )
end

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  # puts event.x, event.y

  # Read the button event
  case event.button
  when :left
    Image.new(
      'img.png',
      x: event.x, y: event.y,
      width: 140, height: 140,
      color: [3.0, 0.5, 0.2, 1.0],
      rotate: 45,
      z: 10
    )
    # Left mouse button pressed down
  when :middle
    # Middle mouse button pressed down
  when :right
    # Right mouse button pressed down
  end
end

show