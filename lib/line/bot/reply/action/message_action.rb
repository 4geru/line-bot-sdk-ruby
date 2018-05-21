class MessageAction
  def initialize(label, text)
    raise ArgumentError, 'Error text is over 300 words' if text.length > 300
    @label = label
    @text = text
  end

  def reply
    expected = {
        type: 'message',
        label: @label,
        text: @text
      }
  end
end

