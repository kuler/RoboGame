module RoboGame

  class Board

    attr_accessor :width, :height

    def initialize(width=5, height=width)
      @width = width
      @height = height
    end

    def field_available?(x, y)
      x.to_i.to_s == x.to_s && x.to_i.between?(0, @width-1) &&
      y.to_i.to_s == y.to_s && y.to_i.between?(0, @height-1)
    end

    def to_s
      "#{@width}x#{@height}"
    end

  end

end