require 'spec_helper'

describe 'ImageArea' do
  context 'reply simple image area' do
    subject(:message_reply) { ImageArea.new(x, y, width, heigh) }
    let(:x) { 0 }
    let(:y) { 0 }
    let(:width) { 10 }
    let(:heigh) { 10 }
    it do
      expected = {
        x: x,
        y: y,
        width: width,
        heigh: heigh
      }
      expect(message_reply.reply).to eq(expected)
    end
  end
end
