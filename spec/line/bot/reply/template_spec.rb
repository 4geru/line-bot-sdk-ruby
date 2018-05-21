require 'spec_helper'

describe 'TemplateReply' do
  context 'argument' do
    let(:confirm) { ConfirmTemplate.new('text', [action, action]) }
    let(:action) { MessageAction.new('title', 'text') }
    it 'not error' do
      expect{ TemplateReply.new('Hello, world', confirm) }.not_to raise_error
    end

    it 'error' do
      expect{ TemplateReply.new('a' * 401, confirm) }.to raise_error ArgumentError
    end
  end

  context 'reply simple template' do
    subject(:message_reply) { TemplateReply.new('altText', confirm)}
    let(:confirm) { ConfirmTemplate.new('text', [action, action]) }
    let(:action) { MessageAction.new('title', 'text') }
    it do
      expected = {
        type: 'template',
        altText: 'altText',
        template: confirm.reply
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
