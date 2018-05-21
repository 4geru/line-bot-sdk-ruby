require 'spec_helper'

describe 'VideoReply' do
  context 'argument' do
    it 'not error' do
      expect{ VideoReply.new('a' * 1000, 'preview_image_url') }.not_to raise_error
      expect{ VideoReply.new('original_content_url', 'a' * 1000) }.not_to raise_error
    end

    it 'error' do
      expect{ VideoReply.new('', 'preview_image_url') }.to raise_error ArgumentError
      expect{ VideoReply.new('original_content_url', '') }.to raise_error ArgumentError
      expect{ VideoReply.new('a' * 1001, 'preview_image_url') }.to raise_error ArgumentError
      expect{ VideoReply.new('original_content_url', 'a' * 1001) }.to raise_error ArgumentError
    end
  end

  context 'reply simple video' do
    subject(:message_reply) { VideoReply.new(original_content_url, preview_image_url)}
    let(:original_content_url) { 'original_content_url' }
    let(:preview_image_url) { 'preview_image_url' }
    it do
      expected = {
        type: 'video',
        originalContentUrl: original_content_url,
        previewImageUrl: preview_image_url
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
