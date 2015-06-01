module RoboGame

  class Robot

    attr_accessor :board
    attr_accessor :x, :y, :heading

    HEADINGS = [:north, :east, :south, :west]

    def initialize(board=Board.new)
      @board = board
    end

    def report
      on_board? ? [@x, @y, @heading] : :unknown
    end

    def place(x, y, heading)

      heading = parse_heading heading

      @x, @y, @heading = x.to_i, y.to_i, heading if @board.field_available?(x, y) && HEADINGS.include?(heading)

      return self
    end

    def forward
      return self unless on_board?

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
      return self unless on_board?

      @heading = heading_index > 0 ? HEADINGS[heading_index - 1] : HEADINGS.last
      return self
    end

    def right
      return self unless on_board?

      @heading = heading_index < HEADINGS.length-1 ? HEADINGS[heading_index + 1] : HEADINGS.first
      return self
    end

    private

    def heading_index
      HEADINGS.index @heading
    end

    def on_board?
      @x && @y && @heading
    end

    def parse_heading(heading)
      if heading.is_a? String
        heading = heading[1..-1] if heading[0]==':'
        heading = heading.to_sym
      end
      heading
    end

  end
end
