class CarouselTemplate
  def initialize(columns, options = {})
    @columns = columns
    @options = options
  end

  def reply
    expected = {
      type: 'carousel',
      columns: @columns[0].reply
    }.merge(@options)
  end
end
