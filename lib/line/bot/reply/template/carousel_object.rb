class CarouselObject
  def initialize(text, actions, options = {})
    raise ArgumentError, 'Error limit 3 actions' if actions.length > 3
    @text = text
    @actions = actions.map{|action| action.reply }
    @options = options
  end

  def reply
    {
      text: @text,
      actions: @actions
    }.merge(@options)
  end
end
