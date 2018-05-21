class AudioReply
  def initialize(original_content_url, duration)
    raise ArgumentError, 'Error url is over 1000 words' if  original_content_url.length > 1000
    raise ArgumentError, 'Error limit 0 words' if  original_content_url.length == 0
    @original_content_url = original_content_url
    @duration = duration
  end

  def reply
    expected = {
      type: 'audio',
      originalContentUrl: @original_content_url,
      duration: @duration
    }
  end
end

