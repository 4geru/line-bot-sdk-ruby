require 'spec_helper'

describe 'ImageCarouselTemplate' do
  context 'argument' do
    let(:action) { MessageAction.new('title', 'text') }
    let(:column) { ImageCarouselObject.new('image_url', [action])}

    it 'over 10 columns' do
      expect{ ImageCarouselTemplate.new([column] * 11) }.to raise_error ArgumentError
    end
  end


  context 'reply simple image carousel template' do
    subject(:message_reply) { ImageCarouselTemplate.new([column])}
    let(:action) { MessageAction.new('title', 'text') }
    let(:column) { ImageCarouselObject.new('image_url', [action])}
    it do
      expected = {
        type: 'carousel',
        columns: [ column.reply ]
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
