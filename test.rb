require 'ruby2d'

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

def coordin x, y
  [get_axis(x).to_i, get_axis(y).to_i]
end

#private

def get_axis event
  num = 0
  hh = {0..199 => [100, 0], 200..399 => [300, 1], 400..600 => [500, 2]}
  hh.to_a.map do |key, value| # переделать на другой метод массива - покороче
    if key.include?(event)
      num = value
    end
  end
  return num
end

x_squares = []


# p "=" * 37

# puts coordin 10, 201

on :mouse_down do |event|
  case event.button
  when :left 
    # puts event.x
    image get_axis(event.x)[0] - 70, get_axis(event.y)[0] - 70
    x_squares << [get_axis(event.x)[1], get_axis(event.y)[1]]
    p x_squares
    if x_squares[0].size == 3
      puts "Win!!!!!!!"
    end
  end
end



show



