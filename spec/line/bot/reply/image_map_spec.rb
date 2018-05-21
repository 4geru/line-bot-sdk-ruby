require 'spec_helper'

describe 'ImageMapReply' do
  context 'argument' do
    it 'not error' do
      expect{ ImageMapReply.new('baseUrl', 'altText', 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))]) }.not_to raise_error
      expect{ ImageMapReply.new('a' * 1000, 'altText', 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))]) }.not_to raise_error
      expect{ ImageMapReply.new('baseUrl' , 'a' * 400, 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))]) }.not_to raise_error
      expect{ ImageMapReply.new('baseUrl', 'altText', 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))] * 50) }.not_to raise_error
    end

    it 'error' do
      expect{ ImageMapReply.new('a' * 1001, 'altText', 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))]) }.to raise_error ArgumentError
      expect{ ImageMapReply.new('baseUrl' , 'a' * 401, 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))]) }.to raise_error ArgumentError
      expect{ ImageMapReply.new('baseUrl', 'altText', 200, 100, [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))] * 51) }.to raise_error ArgumentError
    end
  end

  context 'reply simple image map' do
    subject(:message_reply) { ImageMapReply.new(baseUrl, altText, basesize_width, basesize_heigh, actions) }
    let(:baseUrl) { 'baseUrl' }
    let(:altText) { 'altText' }
    let(:basesize_width) { 200 }
    let(:basesize_heigh) { 100 }
    let(:actions) { [ImageMessageAction.new('uri', ImageArea.new(0, 0, 10, 10))] }
    it do
      expected = {
        type: 'imagemap',
        baseUrl: baseUrl,
        altText: altText,
        basesize_width: basesize_width,
        basesize_heigh: basesize_heigh,
        actions: actions.map{|action| action.reply }
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
