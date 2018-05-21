require 'spec_helper'

describe 'PostbackAction' do
  context 'argument' do
    it 'not error' do
      expect{ PostbackAction.new('label', {}, 'a', '') }.not_to raise_error
      expect{ PostbackAction.new('label', {}, 'a' * 300, '') }.not_to raise_error
      expect{ PostbackAction.new('label', {}, '', 'a' * 300) }.not_to raise_error
    end

    it 'error' do
      expect{ PostbackAction.new('label', {a: 'a' * 300}, 'a' * 301, '') }.to raise_error ArgumentError
      expect{ PostbackAction.new('label', {}, '', 'a' * 301) }.to raise_error ArgumentError
    end

    it 'display_text and text given same time' do
      expect{ PostbackAction.new('label', {}, 'a', 'a') }.to raise_error ArgumentError
    end
  end

  context 'blank argument' do
    subject(:message_reply) { PostbackAction.new('label', {}, '', '').reply }
    it do
      expect(message_reply).to eq PostbackAction.new('label', {}).reply
      expect(message_reply).to eq PostbackAction.new('label', {}, '').reply
      expect(message_reply).to eq PostbackAction.new('label', {}, '', '').reply
    end
  end

  context 'reply simple postback action' do
    subject(:message_reply) { PostbackAction.new(label, data, display_text, text)}
    let(:label) { 'label' }
    let(:data) { {data: true} }
    let(:display_text) { 'display_text' }
    let(:text) { '' }
    it do
      expected = {
        type: 'postback',
        label: label,
        data: 'data=true',
        display_text: display_text,
        text: text
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
