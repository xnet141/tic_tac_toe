class Logic
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
        @game = "stop"
        image 200, 200
        return squares 
      end
    end  
  end
end