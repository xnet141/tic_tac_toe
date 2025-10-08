require_relative 'board'

class Player < Board
  def circle x, y
    Circle.new(
      x: axis(x) * GRID_SIZE + GRID_SIZE/2, y: axis(y) * GRID_SIZE + GRID_SIZE/2,
      radius: 75,
      sectors: 32,
      color: 'fuchsia',
      z: 10
    )
  end
end
