class ConfirmTemplate
  def initialize(text, actions)
    raise ArgumentError, 'Error need 2 actions' if actions.length != 2

    @text = text
    @actions = actions.map{|action| action.reply }
  end

  def reply
    {
      type: 'confirm',
      text: @text,
      actions: @actions
    }
  end
end

