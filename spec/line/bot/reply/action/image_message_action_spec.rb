require 'spec_helper'

describe 'ImageMessageAction' do
  context 'argument' do
    it 'not error' do
      expect{ ImageMessageAction.new('message', ImageArea.new(0, 0, 10, 10)) }.not_to raise_error
      expect{ ImageMessageAction.new('a' * 400, ImageArea.new(0, 0, 10, 10)) }.not_to raise_error
      expect{ ImageMessageAction.new('message', ImageArea.new(0, 0, 10, 10), 'a' * 50) }.not_to raise_error
    end

    it 'error' do
      expect{ ImageMessageAction.new('a' * 401, ImageArea.new(0, 0, 10, 10)) }.to raise_error ArgumentError
      expect{ ImageMessageAction.new('message', ImageArea.new(0, 0, 10, 10), 'a' * 51) }.to raise_error ArgumentError
    end
  end
  context 'undefined label' do
    subject(:image_uri_action) { ImageMessageAction.new('text', ImageArea.new(0, 0, 10, 10)).reply }
    subject(:expected) { ImageMessageAction.new('text', ImageArea.new(0, 0, 10, 10), '').reply }
    it do
      expect( image_uri_action ).to eq expected
    end
  end

  context 'reply simple image message action' do
    subject(:message_reply) { ImageMessageAction.new(text, area, label)}
    let(:text) { 'text' }
    let(:area) { ImageArea.new(0, 0, 10, 10) }
    let(:label) { 'label' }
    it do
      expected = {
        type: 'message',
        label: label,
        text: text,
        area: area.reply,
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
