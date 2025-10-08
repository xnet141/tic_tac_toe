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

  def game_over x, y 
    Image.new(
      'images/game_over.png',
      x: axis(x) * GRID_SIZE + GRID_SIZE/2 - 150, y: axis(y) * GRID_SIZE + GRID_SIZE/2 - 150,
      width: 300, height: 300,
      color: [1.0, 1.1, 0.2, 0.67],
      rotate: 0,
      z: 10
    )
  end
end

p = Player.new
p p.axis 205