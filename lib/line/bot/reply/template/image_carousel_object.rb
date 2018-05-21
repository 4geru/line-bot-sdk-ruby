class ImageCarouselObject
  def initialize(image_url, actions, options = {})
    raise ArgumentError, 'Error limit 3 actions' if actions.length > 3

    @image_url = image_url
    @actions = actions.map{|action| action.reply }
    @options = options
  end

  def reply
    {
      image_url: @image_url,
      actions: @actions
    }.merge(@options)
  end
end
