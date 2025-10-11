require_relative 'logic'

class Player1 < Logic
  def initialize
    super
    @turn = false
  end
    
  def turn
    @turn = !@turn    
  end
end

class Player2 < Logic
  def initialize
    super
  end
end


