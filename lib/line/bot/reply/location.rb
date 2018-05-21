class LocationReply
  def initialize(title, address, latitude, longitude)
    raise ArgumentError, 'Error url is over 100 words' \
      if  title.length > 100 or \
          address.length > 100
    raise ArgumentError, 'Error limit 0 words' \
      if  latitude.to_f.abs > 90.0 or
          longitude.to_f.abs > 180.0
    @title = title
    @address = address
    @latitude = latitude
    @longitude = longitude
  end

  def reply
    expected = {
      type: 'location',
      title: @title,
      address: @address,
      latitude: @latitude,
      longitude: @longitude
    }
  end
end

