def get_axis event
  hh = {0..199 => 0, 200..399 => 1, 400..600 => 2}
  arr = hh.to_a.select do |key, value| 
    key.include?(event)
  end
  arr[0][1]
end

p get_axis 50