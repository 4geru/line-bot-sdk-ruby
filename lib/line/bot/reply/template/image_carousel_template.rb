class ImageCarouselTemplate
  def initialize(columns, options = {})
    raise ArgumentError, 'Error limit 10 columns' if columns.length > 10
    @columns = columns
    @options = options
  end

  def reply
    expected = {
      type: 'carousel',
      columns: @columns.map{|column| column.reply }
    }.merge(@options)
  end
end
