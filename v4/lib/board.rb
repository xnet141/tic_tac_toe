class Board
  attr_accessor :game_start

  def initialize
    @array = Array.new(3) { Array.new(3)}
    @game_start = true
     @x_y = []
  end

  private

  def axis event
    hh = {0..199 => 0, 200..399 => 1, 400..600 => 2}
    arr = hh.to_a.select do |key, value| 
      key.include?(event)
    end
    arr[0][1]
  end

  def array_win_squares array
    [
      [array[0][0],array[1][0],array[2][0]], 
      [array[0][1],array[1][1],array[2][1]],
      [array[0][2],array[1][2],array[2][2]], 
      [array[0][0],array[0][1],array[0][2]],
      [array[1][0],array[1][1],array[1][2]], 
      [array[2][0],array[2][1],array[2][2]],
      [array[0][0],array[1][1],array[2][2]], 
      [array[0][2],array[1][1],array[2][0]],
    ]
  end
end
