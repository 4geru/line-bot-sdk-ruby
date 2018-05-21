require 'spec_helper'

describe 'LocationReply' do
  context 'argument' do
    it 'not error' do
      expect{ LocationReply.new('title', 'address', 0, 0) }.not_to raise_error
      expect{ LocationReply.new('title', 'address', -90, 0) }.not_to raise_error
      expect{ LocationReply.new('title', 'address', 90, 0) }.not_to raise_error
      expect{ LocationReply.new('title', 'address', 0, 180.0) }.not_to raise_error
      expect{ LocationReply.new('title', 'address', 0, -180.0) }.not_to raise_error
    end

    it 'error' do
      expect{ LocationReply.new('a' * 101, 'address', 0, 0) }.to raise_error ArgumentError
      expect{ LocationReply.new('title', 'a' * 101, 0, 0) }.to raise_error ArgumentError
      expect{ LocationReply.new('title', 'address', -90.1, 0) }.to raise_error ArgumentError
      expect{ LocationReply.new('title', 'address', 90.1, 0) }.to raise_error ArgumentError
      expect{ LocationReply.new('title', 'address', 0, 180.1) }.to raise_error ArgumentError
      expect{ LocationReply.new('title', 'address', 0, -180.1) }.to raise_error ArgumentError
    end
  end

  context 'reply simple location' do
    subject(:message_reply) { LocationReply.new(title, address, latitude, longitude)}
    let(:title) { 'title' }
    let(:address) { 'address' }
    let(:latitude) { 0 }
    let(:longitude) { 0 }
    it do
      expected = {
        type: 'location',
        title: title,
        address: address,
        latitude: latitude,
        longitude: longitude
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
