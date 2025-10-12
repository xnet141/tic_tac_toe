require_relative 'logic'

class Player1 < Logic
  def initialize 
    super
    @turn = false
  end
    
  def turn
    @turn = !@turn    
  end
      
  def choose_square x, y, array
    array[x][y] = CircleWithArray.new(
      x: x * GRID_SIZE + GRID_SIZE/2, y: y * GRID_SIZE + GRID_SIZE/2,
      radius: 85,
      sectors: 32,
      color: 'fuchsia',
      z: 2,
      data: [x, y] # show_win_squares squares => x: square[0] * GRID_SIZE, y: square[1] * GRID_SIZE, 
    )
  end
end

class Player2 < Logic
  def choose_square x, y, array
    array[x][y] = ImageWithArray.new(
      'images/img.png',
      x: x * GRID_SIZE, y: y * GRID_SIZE,
      width: 200, height: 200,
      color: [1.0, 1.0, 0.2, 0.9],
      rotate: 45,
      z: 10,
      data: [x, y]
    )
  end
end


