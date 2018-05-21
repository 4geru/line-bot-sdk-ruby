class UriAction
  def initialize(label, uri)
    raise ArgumentError, 'Error uri is over 1000 words' if uri.length > 1000
    @label = label
    @uri = uri
  end

  def reply
    expected = {
        type: 'uri',
        label: @label,
        uri: @uri
      }
  end
end

