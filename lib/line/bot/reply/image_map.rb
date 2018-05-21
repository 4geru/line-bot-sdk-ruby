class ImageMapReply
  def initialize(baseUrl, altText, basesize_width, basesize_heigh, actions)
    raise ArgumentError, 'Error baseUrl is over 1000 words' if baseUrl.length > 1000
    raise ArgumentError, 'Error altText is over 400 words' if altText.length > 400
    raise ArgumentError, 'Error actions is over 50 actions' if actions.length > 50

    @baseUrl = baseUrl
    @altText = altText
    @basesize_width = basesize_width
    @basesize_heigh = basesize_heigh
    @actions = actions
  end

  def reply
    expected = {
        type: 'imagemap',
        baseUrl: @baseUrl,
        altText: @altText,
        basesize_width: @basesize_width,
        basesize_heigh: @basesize_heigh,
        actions: @actions.map{|action| action.reply }
      }
  end
end

