require 'spec_helper'

describe '' do
  context 'argument' do
    it 'not error' do
      expect{ DateTimePickerAction.new('label', {}, 'date', Date.today, Date.today - 1, Date.today + 1) }.not_to raise_error
    end

    it 'min date > max date' do
      expect{ DateTimePickerAction.new('label', {}, 'date', Date.today, Date.today, Date.today - 1) }.to raise_error ArgumentError
    end

    it 'not contain mode' do
      expect{ DateTimePickerAction.new('label', {}, 'foo', Date.today, Date.today - 1, Date.today + 1) }.to raise_error ArgumentError
    end
  end

  context 'reply simple date time picker action' do
    subject(:message_reply) { DateTimePickerAction.new(label, data, mode, initial, max, min)}
    let(:label) { 'label' }
    let(:data) { {data: true} }
    let(:mode) { 'date' }

    context 'define date' do
      let(:initial) { Date.today }
      let(:max) { Date.today - 1 }
      let(:min) { Date.today + 1 }
      it do
        expected = {
          type: 'datetimepicker',
          label: label,
          data: 'data=true',
          mode: mode,
          initial: Date.today.to_s,
          max: max.to_s,
          min: min.to_s
        }
        expect(message_reply.reply).to eq(expected)
      end
    end

    context 'not define initial' do
      let(:initial) { nil }
      let(:max) { nil }
      let(:min) { nil }
      it do
        expected = {
          type: 'datetimepicker',
          label: label,
          data: 'data=true',
          mode: mode,
          initial: '',
          max: '',
          min: '',
        }
        expect(message_reply.reply).to eq(expected)
      end
    end
  end
end
