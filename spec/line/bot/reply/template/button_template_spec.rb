require 'spec_helper'

describe 'ButtonTemplate' do
  context 'argument' do
    let(:action) { MessageAction.new('title', 'text') }

    it 'over 4 actions' do
      expect{ ButtonTemplate.new('text', [action] * 5) }.to raise_error ArgumentError
    end
  end

  context 'reply simple button template' do
    subject(:message_reply) { ButtonTemplate.new(text, actions)}
    let(:text) { 'Hello, world' }
    let(:actions) { [MessageAction.new('title', 'text')] }

    it do
      expected = {
        type: 'buttons',
        text: text,
        actions: actions.map{|action| action.reply }
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
