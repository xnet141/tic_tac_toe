# class Test
#   def initialize x, y
#     @x = x
#     @y = y
#   end

#   def x 
#     p x
#   end

#   def y
#     p y
#   end

# end

# class Exp < Test
#   def initialize(x, y, hh = {})
#     super x, y
    
#     @data = hh[:z]
#   end

#   def []=(index, value)
#     @data[index] = value
#   end

#   def [](index)
#     if index.is_a?(Integer) && index >= 0 && index < @data.size
#       @data[index]
#     else
#       raise IndexError, "Неверный индекс"
#     end
#   end
# end

# # test = Test.new

# # t = Test.new(x: 1, y: 2)
# # p t.inspect

# # p test.class 

# exp = Exp.new(1 ,2, z: [3,1])
# p exp
# p exp.inspect
# p exp[0] = 1
# p exp[0]

p "================================"

class Alex 
  attr_accessor :x, :y
  def initialize(x: nil, y: nil)
    @x = x
    @y = y
  end
end

a = Alex.new(x: 32, y: 43)
p a

class Nick < Alex
  attr_accessor :z

  def initialize(x: nil ,y: nil, z: nil)
    super(x: x, y: y)

    @z = z
  end
end

class Test < Nick
  attr_accessor :test

  def initialize
    @test = true
  end
end

t = Test.new

nick = Nick.new(x: 1, y: 3, z: 42)
p nick
p nick.class
p nick.class.superclass
p t.class.superclass.superclass

t.test = 1
p t.test

class Shared
  @s = "ttttt"
  @inst = "bla"

  class << self
    attr_accessor :s
    def test_s

    end
  end

  def get_s_and_inst
    self.class.s
  end
end

Shared.s = 2

p Shared.s


s = Shared.new
p "=================="
p s.get_s_and_inst
