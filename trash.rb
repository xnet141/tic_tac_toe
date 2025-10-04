require 'ruby2d'

set title: "Hello!"

GRID_SIZE = 200
WIDTH = 3 
HEIGHT = 3
GRID_COLOR = Color.new('#222222')
BLOCK_COLOR = Color.new(['orange', 'yellow', 'green'].sample)

Line.new(
  x1: GRID_SIZE, y1: 0,
  x2: GRID_SIZE*2, y2: GRID_SIZE,
  width: 10,
  color: 'lime',
  z: 20
)

Line.new(
  x1: GRID_SIZE*2, y1: 0,
  x2: GRID_SIZE, y2: GRID_SIZE,
  width: 10,
  color: 'lime',
  z: 20
)

Square.new(
  x: 100, y: 200,
  size: 125,
  color: 'blue',
  z: 10
)

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

Triangle.new(
  x1: 320, y1:  50,
  x2: 540, y2: 430,
  x3: 100, y3: 430,
  color: ['red', 'green', 'blue']
)

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


image 450, 150

show