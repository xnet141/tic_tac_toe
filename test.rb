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

# def reset!(*objects)
#   objects.map(&:reset!)
# end

def circle x, y
  Circle.new(
    x: axis_coord(x), y: axis_coord(y),
    radius: 75,
    sectors: 32,
    color: 'fuchsia',
    z: 10
  )
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

def x_squares_for_victory array
  p "def square ===================== begin"
  array.dup.map!.with_index do |square, i| # СЛОЖИТЬ i
    p "square #{square}"
    square.rotate!(1) if i == 0
    square.rotate!(2) if i == 2
    p "square rotate#{square}"
    if square.include?(nil)# || !square.rotate(-1).include?(nil) || !square.rotate(1).include?(nil)
      puts "x_square#{i}: #{square}"
    else
      image 200, 200
      puts "Rotate Victory!!!!!!!!!!!!!!!!!"
      show_win_squares square # sleep
      game = "stop"
    end
  end
  p "def square ===================== end"
end

x_squares_0 = Array.new(3) { Array.new(3)}
x_squares_1 = Array.new(3) { Array.new(3)}
x_squares_2 = Array.new(3) { Array.new(3)}

x_squares = [x_squares_0, x_squares_1, x_squares_2]

win_squares_1 = [
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

game = nil
on :mouse_down do |event| # [get_axis(event.x)[1], get_axis(event.y)[1]]
  case event.button
  when :left
    if game!= "stop" 
      p "!!!x_squares_1: #{x_squares_1}"
      p axis_part(event.y)
      p axis_part(event.x)

      # image event.x, event.y
      circle event.x, event.y
      count = 0 # rotate
      x_squares[0][axis_part(event.y)][axis_part(event.x)] = axis_part(event.x), axis_part(event.y)
      x_squares[1][axis_part(event.x)][axis_part(event.y)] = axis_part(event.x), axis_part(event.y)
      # x_squares[2][axis_part(event.y)][axis_part(event.x)] = axis_part(event.x), axis_part(event.y)
      p "================="
      p "x_squares 2 #{x_squares[2]}"
      #  x_squares[2][0].rotate!(1)
      #  x_squares[2][2].rotate!(1)
      p "x_squares 2 #{x_squares[2]}"
      p "=================="
      while count < 2 # 2
        x_squares[count].each.with_index do |square, i| # СЛОЖИТЬ i
          if square.include?(nil)# || !square.rotate(-1).include?(nil) || !square.rotate(1).include?(nil)
            puts "x_square#{i}: #{square}"
          else
            image 200, 200
            puts "Victory!!!!!!!!!!!!!!!!!"
            show_win_squares square # sleep
            game = "stop"
          end
        end
        x_squares_for_victory x_squares[count]
        count += 1
      end
    end
  when :right
    close
  end
end




show