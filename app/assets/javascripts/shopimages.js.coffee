jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#shopimage_image_cropbox').Jcrop
      aspectRatio: 16 / 9
      setSelect: [200, 200, 200, 200]
      onSelect: @update
      onChange: @update      
      minSize:[640,228]

  update: (coords) =>
    $('#shopimage_image_crop_x').val(coords.x)
    $('#shopimage_image_crop_y').val(coords.y)
    $('#shopimage_image_crop_w').val(coords.w)
    $('#shopimage_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#shopimage_image_previewbox').css
      width: Math.round(100/coords.w * $('#shopimage_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#shopimage_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
