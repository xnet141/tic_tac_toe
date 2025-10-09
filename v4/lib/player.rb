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

  def image x, y 
    Image.new(
      'images/img.png',
      x: axis_coord(x).to_i - 70, y: axis_coord(y).to_i - 70,
      width: 140, height: 140,
      color: [3.0, 0.5, 0.2, 1.0],
      rotate: 45,
      z: 10
    )
  end
end
