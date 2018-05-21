class ImageReply
  def initialize(original_content_url, preview_image_url)
    raise ArgumentError, 'Error url is over 1000 words' \
      if  original_content_url.length > 1000 or \
          preview_image_url.length > 1000
    raise ArgumentError, 'Error limit 0 words' \
      if  original_content_url.length == 0 or \
          preview_image_url.length == 0
    @original_content_url = original_content_url
    @preview_image_url = preview_image_url
  end

  def reply
    expected = {
      type: 'image',
      originalContentUrl: @original_content_url,
      previewImageUrl: @preview_image_url
    }
  end
end

