class Board
  attr_accessor :game_start

  def initialize
    @array = Array.new(3) { Array.new(3)}
    @game_start = true
     @x_y = []
  end

  private

  class CircleWithArray < Circle
    def initialize(x: 25, y: 25, z: 0, radius: 50, sectors: 30,
                   color: nil, colour: nil, opacity: nil, data: nil)
      super(x: x, y: y, z: z, radius: radius, sectors: sectors,
            color: color, colour: colour, opacity: opacity)
      
      @data = data
    end
    # def []=(index, value)
    #   @data[index] = value
    # end
    def [](index)
      if index.is_a?(Integer) && index >= 0 && index < @data.size
        @data[index]
      else
        raise IndexError, "Неверный индекс"
      end
    end
  end

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
