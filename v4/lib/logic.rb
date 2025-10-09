require_relative 'board'

class Logic < Board
  attr_accessor :game_start

  def initialize
   # Может лучше указывать везде @, не передавая через параметры функции переменную
    @array = Array.new(3) { Array.new(3)}
    @game_start = true
  end
 
  def logic event_x, event_y 
    x = axis(event_x) 
    y = axis(event_y)
    win_squares x, y
  end
  
  private
  
  def win_squares x, y
    choose_square x, y
    array_win_squares(@array).each do |squares| 
      if !squares.include?(nil)
        show_win_squares(squares) 
        game_over 2, 2
        # return squares 
      end
    end  
  end

  def choose_square x, y
    @array[x][y] = x, y
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
  end

  def game_over x, y
    @game_start = !@game_start
    Image.new(
      'images/game_over.png',
      x: x * GRID_SIZE + GRID_SIZE/2 - 150, y: y * GRID_SIZE + GRID_SIZE/2 - 150,
      width: 300, height: 300,
      color: [1.0, 1.1, 0.2, 0.67],
      rotate: 0,
      z: 10
    )
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