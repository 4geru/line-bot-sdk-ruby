require 'spec_helper'

describe 'ImageUriAction' do
  context 'argument' do
    it 'not error' do
      expect{ ImageUriAction.new('link_uri', ImageArea.new(0, 0, 10, 10)) }.not_to raise_error
      expect{ ImageUriAction.new('a' * 1000, ImageArea.new(0, 0, 10, 10)) }.not_to raise_error
      expect{ ImageUriAction.new('link_uri', ImageArea.new(0, 0, 10, 10), 'a' * 50) }.not_to raise_error
    end

    it 'error' do
      expect{ ImageUriAction.new('a' * 1001, ImageArea.new(0, 0, 10, 10)) }.to raise_error ArgumentError
      expect{ ImageUriAction.new('link_uri', ImageArea.new(0, 0, 10, 10), 'a' * 51) }.to raise_error ArgumentError
    end
  end

  context 'undefined label' do
    subject(:image_uri_action) { ImageUriAction.new('link_uri', ImageArea.new(0, 0, 10, 10)).reply }
    subject(:expected) { ImageUriAction.new('link_uri', ImageArea.new(0, 0, 10, 10), '').reply }
    it do
      expect( image_uri_action ).to eq expected
    end
  end

  context 'reply simple image url action' do
    subject(:message_reply) { ImageUriAction.new(link_uri, area, label)}
    let(:link_uri) { 'link_uri' }
    let(:area) { ImageArea.new(0, 0, 10, 10) }
    let(:label) { 'label' }
    it do
      expected = {
        type: 'uri',
        label: label,
        linkUri: link_uri,
        area: area.reply,
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
