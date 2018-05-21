class StickerReply
  def initialize(package_id, sticker_id)
    @package_id = package_id.to_s
    @sticker_id = sticker_id.to_s
  end

  def reply
    expected = {
      type: 'sticker',
      packageId: @package_id,
      stickerId: @sticker_id
    }
  end
end

