class X
  def initialize
    @x_squares = [
      [0, 0]
    ]
  end

  def show
    @x_squares.each do |square|
      Square.new(
        x: square[0] * GRID_SIZE,
        y: square[1] * GRID_SIZE,
        size: GRID_SIZE,
        color: 'green'
      )
    end
  end
end