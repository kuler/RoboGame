module RoboGame

  class Robot

    attr_accessor :board
    attr_accessor :x, :y, :heading

    HEADINGS = [:north, :east, :south, :west]

    def initialize(board=Board.new)
      @board = board
      @x, @y, @heading = 0, 0, :north
    end

    def report
      [@x, @y, @heading]
    end

    def place(x, y, heading)

      heading = heading.to_sym if heading.is_a? String

      @x, @y, @heading = x.to_i, y.to_i, heading if @board.field_available?(x, y) && HEADINGS.include?(heading)

      return self
    end

    def forward

      x, y = @x, @y

      case @heading
        when :north then
          y = y + 1
        when :south then
          y = y - 1
        when :east then
          x = x + 1
        when :west then
          x = x - 1
      end

      @x, @y = x, y if @board.field_available?(x, y)

      return self
    end

    alias_method :move, :forward

    def left
      @heading = headingIndex > 0 ? HEADINGS[headingIndex - 1] : HEADINGS.last
      return self
    end

    def right
      @heading = headingIndex < HEADINGS.length-1 ? HEADINGS[headingIndex + 1] : HEADINGS.first
      return self
    end

    private

    def headingIndex
      HEADINGS.index @heading
    end

  end
end
