require_relative 'board'

class Logic < Board
  attr_accessor :array, :game_start

  def initialize
    @x, @y
    @array = Array.new(3) { Array.new(3)}
    @start = true
  end
 
  def logic 
    squares_victory
  end
  
  private
  
  def squares_victory array, game
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
    .each do |squares| 
      if !squares.include?(nil)
        show_win_squares(squares) 
        return squares 
      end
    end  
  end

  def show_win_squares squares
    squares.each do |square|
      Square.new(
        x: square[0] * GRID_SIZE,
        y: square[1] * GRID_SIZE,
        size: GRID_SIZE,
        color: 'yellow'
      )
    end
    game_over #добавить x, y
  end

  def game_over x, y
    @game_start = !@game_start
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