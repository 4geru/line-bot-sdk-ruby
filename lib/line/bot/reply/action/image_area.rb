class ImageArea
  def initialize(x, y, width, heigh)
    @x = x.to_i
    @y = y.to_i
    @width = width.to_i
    @heigh = heigh.to_i
  end

  def reply
    expected = {
        x: @x,
        y: @y,
        width: @width,
        heigh: @heigh
    }
  end
end

