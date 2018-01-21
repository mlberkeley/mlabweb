//= require jquery.Jcrop

var PictureCropper,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

jQuery(function() {
  return new PictureCropper();
});

PictureCropper = (function() {
  function PictureCropper() {
    this.updatePreview = bind(this.updatePreview, this);
    this.update = bind(this.update, this);
    $('#cropbox').Jcrop({
      aspectRatio: 1,
      setSelect: [0, 0, 600, 600],
      onSelect: this.update,
      onChange: this.update
    });
  }

  PictureCropper.prototype.update = function(coords) {
    $('#member_crop_x').val(coords.x);
    $('#member_crop_y').val(coords.y);
    $('#member_crop_w').val(coords.w);
    $('#member_crop_h').val(coords.h);
    return this.updatePreview(coords);
  };

  PictureCropper.prototype.updatePreview = function(coords) {
    return $('#preview').css({
      width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
      height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
      marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
      marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
    });
  };

  return PictureCropper;

})();
