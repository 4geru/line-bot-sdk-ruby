require 'spec_helper'

describe 'StickerReply' do
  context 'reply simple sticker' do
    subject(:message_reply) { StickerReply.new(1, 1)}
    it do
      expected = {
        type: 'sticker',
        packageId: '1',
        stickerId: '1'
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
