class ImageUriAction
  def initialize(link_uri, area, label = '')
    raise ArgumentError, 'Error label is over 50 words' if label.length > 50
    raise ArgumentError, 'Error link_uri is over 1000 words' if link_uri.length > 1000

    @label = label || ''
    @link_uri = link_uri
    @area = area
  end

  def reply
    expected = {
        type: 'uri',
        label: @label,
        linkUri: @link_uri,
        area: @area.reply,
      }
  end
end

