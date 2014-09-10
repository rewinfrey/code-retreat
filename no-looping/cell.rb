class Cell
  attr_reader :x, :y
  attr_accessor :state

  def initialize(x, y)
    @x = x
    @y = y
    @state = :alive
  end
end
