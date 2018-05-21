require 'spec_helper'

describe 'MessageReply' do
  context 'argument' do
    it 'not error' do
      expect{ MessageReply.new('a' * 2000) }.not_to raise_error
      expect{ MessageReply.new('Hello, world') }.not_to raise_error
    end

    it 'error' do
      expect{ MessageReply.new('') }.to raise_error ArgumentError
      expect{ MessageReply.new('a' * 2001) }.to raise_error ArgumentError
    end
  end

  context 'reply simple message' do
    subject(:message_reply) { MessageReply.new(text)}
    let(:text) { 'Hello, world' }
    it do
      expected = {
        type: 'text',
        text: text
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
