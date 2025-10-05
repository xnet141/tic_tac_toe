arr = [[0,0],[1,0],[2,0],[1,2],[1,1]]

win = [
  [[0,0],[1,0],[2,0]],
  [[0,1],[1,1],[2,1]],
  [[0,2],[1,2],[2,2]]
]

p arr

p win[0]

puts "==========="

p copy = arr.slice(0, 3)

p copy.rotate(1) 

p arr.include? [[0,0],[1,0],[2,0]]

def get_axis event
  hh = {0..199 => [100, 0], 200..399 => [300, 1], 400..600 => [500, 2]}
  arr = hh.to_a.select do |key, value| # переделать на другой метод массива - покороче
    key.include?(event)
  end
  arr[0][1]
end

p get_axis 50

arr1 = Array.new(3) { Array.new(3)}
arr1[0][0] = arr1[0][1] = arr1[0][2] = 111
p arr1
p arr1[0].include? nil