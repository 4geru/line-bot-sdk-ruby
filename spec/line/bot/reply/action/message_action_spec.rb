require 'spec_helper'

describe 'MessageAction' do
  context 'argument' do
    it 'not error' do
      expect{ MessageAction.new('label', 'text') }.not_to raise_error
      expect{ MessageAction.new('label', 'a' * 300) }.not_to raise_error
    end

    it 'error' do
      expect{ MessageAction.new('label', 'a' * 301) }.to raise_error ArgumentError
    end
  end

  context 'reply simple message action' do
    subject(:message_reply) { MessageAction.new(label, text) }
    let(:label) { 'label' }
    let(:text) { 'text' }
    it do
      expected = {
        type: 'message',
        label: label,
        text: text
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
