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



def image event_x, event_y 
  Image.new(
    'img.png',
    x: get_axis(event_x)[0].to_i - 70, y: get_axis(event_y)[0].to_i - 70,
    width: 140, height: 140,
    color: [3.0, 0.5, 0.2, 1.0],
    rotate: 45,
    z: 10
  )
end

def coordin_square x, y
  [get_axis(x)[1].to_i, get_axis(y)[1].to_i]
end

#private

def get_axis event
  hh = {0..199 => [100, 0], 200..399 => [300, 1], 400..600 => [500, 2]}
  arr = hh.to_a.select do |key, value| 
    key.include?(event)
  end
  arr[0][1]
end

# x_squares = [Array.new(3) { Array.new(3)}]
x_squares = []
win_squares = [
  [[0,0],[1,0],[2,0]],
  [[0,1],[1,1],[2,1]],
  [[0,2],[1,2],[2,2]]
]



sum = 0
arr = 0
on :mouse_down do |event| # [get_axis(event.x)[1], get_axis(event.y)[1]]
  case event.button
  when :left 
    from_coordin_square = coordin_square(event.x, event.y)
    # if x_squares.include?(from_coordin_square) == false
      image event.x, event.y
      # x_squares[from_coordin_square[1]][from_coordin_square[0]] = from_coordin_square
      # puts "add"
        x_squares << from_coordin_square
      # x_squares.sort!
      x_squares.each.with_index do |x_square, i|
        if x_square.include? [i, i] && i <= 2 
          puts "x_square: #{x_square}"
          break
        end
      end



      puts "x_squares: #{x_squares}"
      # puts "win!!!!!!!: #{win}"

      # win_squares.include?
      # p x_squares
      p "arr: #{arr.inspect}"
      # arr = x_squares.map do |square|
      #   puts "square: #{square}"
      #   puts "square[0]: #{square[0]}"
      #   sum += square[0]
      #   p sum
        
      #   p "Win!!!!!" if sum == 3
        
      #   square[0]
      # end
      # p arr.inspect
      # arr = 0
      # p x_squares
      # x_squares
      p "============"
    end
  # end
  
  sum = 0 
end

show



