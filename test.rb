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
    x: axis_coord(x).to_i - 70, y: axis_coord(y).to_i - 70,
    width: 140, height: 140,
    color: [3.0, 0.5, 0.2, 1.0],
    rotate: 45,
    z: 10
  )
end

# def coordin_square x, y
#   [get_axis(x)[1].to_i, get_axis(y)[1].to_i]
# end

def axis_coord n
  get_axis(n)[0]
end

def axis_part n
  get_axis(n)[1]
end
#private

def get_axis event
  hh = {0..199 => [100, 0], 200..399 => [300, 1], 400..600 => [500, 2]}
  arr = hh.to_a.select do |key, value| 
    key.include?(event)
  end
  arr[0][1]
end

x_squares = Array.new(3) { Array.new(3)}
# x_squares = []
win_squares = [
  [[0,0],[1,0],[2,0]],
  [[0,1],[1,1],[2,1]],
  [[0,2],[1,2],[2,2]]
]
win_squares_2 = [
  [[0,0],[0,1],[0,2]],
  [[1,0],[1,1],[1,2]],
  [[2,0],[2,1],[2,2]]  
]
win_squares_3 = [
  [[0,0],[1,1],[2,2]],
  [[2,0],[1,1],[0,2]] 
]


on :mouse_down do |event| # [get_axis(event.x)[1], get_axis(event.y)[1]]

  case event.button
  when :left 
    p x_squares
    p axis_part(event.y)
    p axis_part(event.x)
    image event.x, event.y

    x_squares[axis_part(event.x)][axis_part(event.y)] = axis_part(event.x), axis_part(event.y)
    x_squares.each.with_index do |square, i| # СЛОЖИТЬ ИТЫЕ
      if !square.include? nil
        puts "x_square: #{square}"
      else
        puts "X_winnnn!!!!!dadadsdasdasdsa"
      end
    end
  end
end

show



