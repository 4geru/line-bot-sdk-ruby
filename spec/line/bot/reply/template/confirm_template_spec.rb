require 'spec_helper'

describe 'ConfirmTemplate' do
  context 'argument' do
    let(:action) { MessageAction.new('title', 'text')}
    it 'not error' do
      expect{ ConfirmTemplate.new('text', [ action, action ]) }.not_to raise_error
    end

    it 'error' do
      expect{ ConfirmTemplate.new('text', [ action ]) }.to raise_error ArgumentError
    end
  end

  context 'reply simple confirm template' do
    subject(:message_reply) { ConfirmTemplate.new(text, actions)}
    let(:text) { 'Hello, world' }
    let(:actions) { [
      MessageAction.new('title', 'text'),
      MessageAction.new('title', 'text')
    ] }

    it do
      expected = {
        type: 'confirm',
        text: text,
        actions: actions.map{|action| action.reply }
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
