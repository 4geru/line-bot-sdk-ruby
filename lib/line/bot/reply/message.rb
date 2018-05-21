class MessageReply
  def initialize(text)
    raise ArgumentError, 'Error text is over 2000 words' if text.length > 2000
    raise ArgumentError, 'Error text is 0 words' if text == ''
    @text = text
  end

  def reply
    expected = {
      type: 'text',
      text: @text
    }
  end
end
