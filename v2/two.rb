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

array = Array.new(3) { Array.new(3)}

def circle x, y
  Circle.new(
    x: axis(x) * GRID_SIZE + GRID_SIZE/2, y: axis(y) * GRID_SIZE + GRID_SIZE/2,
    radius: 75,
    sectors: 32,
    color: 'fuchsia',
    z: 10
  )
end

def image x, y 
  Image.new(
    'images/img.png',
    x: axis(x) * GRID_SIZE + GRID_SIZE/2 - 70, y: axis(y) * GRID_SIZE + GRID_SIZE/2 - 70,
    width: 140, height: 140,
    color: [3.0, 0.5, 0.2, 1.0],
    rotate: 45,
    z: 10
    )
end

def axis event
  hh = {0..199 => 0, 200..399 => 1, 400..600 => 2}
  arr = hh.to_a.select do |key, value| 
    key.include?(event)
  end
  arr[0][1]
end

def show_win_squares squares
  squares.each do |square|
    Square.new(
      x: square[0] * GRID_SIZE,
      y: square[1] * GRID_SIZE,
      size: GRID_SIZE,
      color: 'yellow'
    )
  end
end

def squares_victory array, game
  squares_arr = [
                 [array[0][0],array[1][0],array[2][0]], 
                 [array[0][1],array[1][1],array[2][1]],
                 [array[0][2],array[1][2],array[2][2]], 
                 [array[0][0],array[0][1],array[0][2]],
                 [array[1][0],array[1][1],array[1][2]], 
                 [array[2][0],array[2][1],array[2][2]],
                 [array[0][0],array[1][1],array[2][2]], 
                 [array[0][2],array[1][1],array[2][0]],
                ]
  squares_arr.each do |squares| 
    if !squares.include?(nil)
      show_win_squares(squares) 
      @game = "stop"
      image 200, 200
      return squares 
    end
  end  
end

@game = nil
on :mouse_down do |event| 
  case event.button
  when :left
    if @game != "stop"
      array[axis(event.y)][axis(event.x)] = axis(event.x), axis(event.y)
      circle event.x, event.y
  
      squares_victory array, @game
    end  
  when :right
    close
  end
end


show

