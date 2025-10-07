require 'ruby2d'


arr = [
  [1,2,3],
  [3,4,5],
  [nil,7,8]
]

a = arr.map do |i| 
  i.rotate(1)
end

p arr
p arr.dup
p a

var = 42

square = 2.integer? if true
p square 

def diagonal_squares_victory array
  squares_arr = [[array[0][0],array[1][1],array[2][2]], [array[0][2],array[1][1],array[2][0]]]
  squares_arr.each do |squares| 
    if !squares.include?(nil)
      show_win_squares(squares) 
      return squares 
    end
  end  
end

def show_win_squares squares
  squares.each do |square|
    puts "win"
  end
end

p "========================"
p diagonal_squares_victory arr