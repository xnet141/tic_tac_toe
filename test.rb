p (1..5)
p (1..5).class

arr = (1...5).map {|i| p i}
range = (1...5).each {|i| p i}

p arr.class
p range.class

hh = {0..199 => 100, 200..399 => 300, 400..600 => 500}

def coordin x, y
  [get_axis(x).to_i, get_axis(y).to_i]
end

#private

def get_axis event
  num = 0
  hh = {0..199 => 100, 200..399 => 300, 400..600 => 500}
  hh.to_a.map do |key, value| # переделать на другой метод массива - покороче
    if key.include?(event)
      num = value 
    end
  end
  return num
end

p "=" * 37

puts coordin 10, 201



