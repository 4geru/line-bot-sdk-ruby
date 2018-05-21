require 'uri'

class DateTimePickerAction
  def initialize(label, data, mode, initial = nil, max = nil, min = nil)
    raise ArgumentError, 'Error mode is not correct mode' if not ['date', 'time', 'datetime'].include?(mode)
    if not min.nil?
      raise ArgumentError, 'Error max is smaller min' if max > min
    end
    @label = label
    @data = URI.encode_www_form(data) 
    @mode = mode
    @initial = initial
    @max = max
    @min = min
    raise ArgumentError, 'Error data is over 300 words' if @data.length > 300
  end

  def reply
    expected = {
      type: 'datetimepicker',
      label: @label,
      data: @data,
      mode: @mode,
      initial: @initial.to_s,
      max: @max.to_s,
      min: @min.to_s
    }
  end
end

