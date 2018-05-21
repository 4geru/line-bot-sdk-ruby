require 'spec_helper'

describe 'ImageCarouselObject' do
  context 'argument' do
    let(:action) { MessageAction.new('title', 'text') }

    it 'over 3 actions' do
      expect{ ImageCarouselObject.new('image_url', [action] * 4) }.to raise_error ArgumentError
    end
  end

  context 'reply simple image carousel object' do
    subject(:message_reply) { ImageCarouselObject.new('image_url', actions)}
    let(:actions) { [MessageAction.new('title', 'text')] }

    it do
      expected = {
        image_url: 'image_url',
        actions: actions.map{|action| action.reply }
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
