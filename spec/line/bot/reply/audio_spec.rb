require 'spec_helper'

describe 'AudioReply' do
  context 'argument' do
    it 'not error' do
      expect{ AudioReply.new('a' * 1000, 100) }.not_to raise_error
    end

    it 'error' do
      expect{ AudioReply.new('', 100) }.to raise_error ArgumentError
      expect{ AudioReply.new('a' * 1001, 100) }.to raise_error ArgumentError
    end
  end

  context 'reply simple audio' do
    subject(:message_reply) { AudioReply.new(original_content_url, duration)}
    let(:original_content_url) { 'original_content_url' }
    let(:duration) { 100 }
    it do
      expected = {
        type: 'audio',
        originalContentUrl: original_content_url,
        duration: duration
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
