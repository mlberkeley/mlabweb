//= require jquery.Jcrop

jQuery(() => new PictureCropper());

class PictureCropper {
  constructor() {
    this.update = this.update.bind(this);
    this.updatePreview = this.updatePreview.bind(this);
    $('#cropbox').Jcrop({
      aspectRatio: 1,
      setSelect: [0, 0, 600, 600],
      onSelect: this.update,
      onChange: this.update
    });
  }

  update(coords) {
    $('#member_crop_x').val(coords.x);
    $('#member_crop_y').val(coords.y);
    $('#member_crop_w').val(coords.w);
    $('#member_crop_h').val(coords.h);
    return this.updatePreview(coords);
  }

  updatePreview(coords) {
    return $('#preview').css({
        width: Math.round((100/coords.w) * $('#cropbox').width()) + 'px',
        height: Math.round((100/coords.h) * $('#cropbox').height()) + 'px',
        marginLeft: `-${Math.round((100/coords.w) * coords.x)}px`,
        marginTop: `-${Math.round((100/coords.h) * coords.y)}px`
    });
  }
}
