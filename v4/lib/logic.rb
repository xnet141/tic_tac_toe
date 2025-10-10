require_relative 'board'

class Logic < Board

 
  def logic event_x, event_y 
    x = axis(event_x) 
    y = axis(event_y)
    win_squares x, y
  end
  
  private
 
  def win_squares x, y
    choose_square(x, y)
    
    array_win_squares(@array).each do |squares| 
      if !squares.include?(nil)
        show_win_squares squares
        game_over 1, 1
        # return squares 
      end
    end  
  end

  def choose_square x, y
    @array[x][y] = CircleWithArray.new(
                     x: x * GRID_SIZE + GRID_SIZE/2, y: y * GRID_SIZE + GRID_SIZE/2,
                     radius: 75,
                     sectors: 32,
                     color: 'fuchsia',
                     z: 10,
                     data: [x, y] # show_win_squares squares => x: square[0] * GRID_SIZE, y: square[1] * GRID_SIZE, 
                   )
    
  end
  
  def show_win_squares squares
    squares.each do |square|
      p square
      Square.new(
        x: square[0] * GRID_SIZE, y: square[1] * GRID_SIZE,
        size: GRID_SIZE,
        color: 'yellow',
        z: 1
      )
    end
  end

  def game_over x, y
    @game_start = !@game_start
    Image.new(
      'images/game_over.png',
      x: x * GRID_SIZE - 50, y: y * GRID_SIZE - 50,
      width: 300, height: 300,
      color: [1.5, 1.5, 0.2, 0.67],
      rotate: 0,
      z: 10
    )
  end
end