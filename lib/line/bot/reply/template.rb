class TemplateReply
  def initialize(alt_text, confirm)
    raise ArgumentError, 'Error alt_text is over 400 words' if alt_text.length > 400
    @altText = alt_text
    @confirm = confirm.reply
  end

  def reply
    expected = {
      type: 'template',
      altText: @altText,
      template: @confirm
    }
  end
end
