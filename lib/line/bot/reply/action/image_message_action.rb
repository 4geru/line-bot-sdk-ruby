class ImageMessageAction
  def initialize(text, area, label = '')
    raise ArgumentError, 'Error label is over 50 words' if label.length > 50
    raise ArgumentError, 'Error text is over 400 words' if text.length > 400

    @label = label || ''
    @text = text
    @area = area
  end

  def reply
    expected = {
        type: 'message',
        label: @label,
        text: @text,
        area: @area.reply,
      }
  end
end

