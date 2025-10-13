require_relative 'board'

class Logic < Board
  def logic event_x, event_y 
    array_win_squares = Board.array_win_squares
    array = Board.array # self.class.superclass.superclass.array
    x = axis event_x
    y = axis event_y
    win_squares x, y, array, array_win_squares
  end

  def game_start
    Board.game_start # self.class.superclass.superclass.game_start
  end
  
  private

  def win_squares x, y, array
    if square_nil? x, y, array
      p "square_nil? x, y #{square_nil? x, y, array}"
      p choose_square x, y, array

      Board.array_win_squares.each do |squares|
        p squares.inspect 
        if squares.all? {|square| square != nil && square.class == squares.first.class}
          show_win_squares squares
          game_over 1, 1
          # return squares
        end 
      end

      if squares_all_none_nil? Board.array_win_squares
        return game_over 1, 1 
      end
      p "no_nil_squares #{squares_all_none_nil? array_win_squares}"
    else
      puts "!!Choose a free square!!"
    end  
  end  
  
  def squares_all_none_nil? array_win_squares
    array_win_squares.all? {|squares| squares.none?(nil)}
  end

  def square_nil? x, y, array
    array[x][y] == nil
  end

  def show_win_squares squares
    squares.each do |square|
      Square.new(
        x: square[0] * GRID_SIZE, y: square[1] * GRID_SIZE,
        size: GRID_SIZE,
        color: 'yellow',
        z: 1
      )
    end
  end
  
  def game_over x, y
    Board.game_start = false
    puts "#{self.class} Win!!!!!!"
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