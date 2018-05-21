require 'uri'

class PostbackAction
  def initialize(label, data, display_text = '', text = '')
    raise ArgumentError, 'Error cannot give display_text and text' if display_text.length * text.length != 0
    raise ArgumentError, 'Error display_text is over 300 words' if display_text.length > 300
    raise ArgumentError, 'Error text is over 300 words' if text.length > 300
    @label = label
    @data = URI.encode_www_form(data)
    @display_text = display_text
    @text = text
    raise ArgumentError, 'Error data is over 300 words' if @data.length > 300
  end

  def reply
    expected = {
        type: 'postback',
        label: @label,
        data: @data,
        display_text: @display_text,
        text: @text
      }
  end
end

