require 'spec_helper'

describe 'UriAction' do
  context 'argument' do
    it 'not error' do
      expect{ UriAction.new('label', 'uri') }.not_to raise_error
      expect{ UriAction.new('label', 'a' * 1000) }.not_to raise_error
    end

    it 'error' do
      expect{ UriAction.new('label', 'a' * 1001) }.to raise_error ArgumentError
    end
  end

  context 'reply simple uri action' do
    subject(:message_reply) { UriAction.new(label, uri) }
    let(:label) { 'label' }
    let(:uri) { 'uri' }
    it do
      expected = {
        type: 'uri',
        label: label,
        uri: uri
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
