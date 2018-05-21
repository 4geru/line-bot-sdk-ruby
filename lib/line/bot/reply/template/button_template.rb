class ButtonTemplate
  def initialize(text, actions, options = {})
    raise ArgumentError, 'Error limit 4 actions' if actions.length > 4

    @text = text
    @actions = actions.map{|action| action.reply }
    @options = options
  end

  def reply
    {
      type: 'buttons',
      text: @text,
      actions: @actions
    }.merge!(@options)
  end
end

