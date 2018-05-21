require 'spec_helper'

describe 'CarouselTemplate' do
  context 'argument' do
    let(:action) { MessageAction.new('title', 'text') }
    let(:column) { CarouselObject.new('text', [action])}

    it 'over 10 columns' do
      expect{ CarouselTemplate.new([column] * 11) }.to raise_error ArgumentError
    end
  end

  context 'reply simple carousel template' do
    subject(:message_reply) { CarouselTemplate.new([column])}
    let(:action) { MessageAction.new('title', 'text') }
    let(:column) { CarouselObject.new('text', [action])}
    it do
      expected = {
        type: 'carousel',
        columns: [ column.reply ]
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
