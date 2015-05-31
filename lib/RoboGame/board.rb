class Board

  attr_accessor :width
  attr_accessor :height

  def initialize(width=5, height=width)
    @width = width
    @height = height
  end

  def field_available?(x,y)
    x.is_a?(Numeric) && \
    y.is_a?(Numeric) && \
    x >= 0 && \
    y >= 0 && \
    x < @width && \
    y < @height
  end

end