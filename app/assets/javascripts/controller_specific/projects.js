//= require jquery.Jcrop
//= require owl.carousel

var owl;
owl = function() {
  $(".owl-carousel").owlCarousel({
    nav:true,
  })
};

$(document).on('turbolinks:load', owl());

$(document).on('turbolinks:click', function (event) {

});

var BgCropper,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

jQuery(function() {
  return new BgCropper();
});

BgCropper = (function() {
  function BgCropper() {
    this.updatePreview = bind(this.updatePreview, this);
    this.update = bind(this.update, this);
    $('#cropbox').Jcrop({
      aspectRatio: 4.25,
      setSelect: [0, 0, 425, 100],
      onSelect: this.update,
      onChange: this.update
    });
  }

  BgCropper.prototype.update = function(coords) {
    $('#project_crop_x').val(coords.x);
    $('#project_crop_x').val(coords.y);
    $('#project_crop_x').val(coords.w);
    $('#project_crop_x').val(coords.h);
    return this.updatePreview(coords);
  };

  BgCropper.prototype.updatePreview = function(coords) {
    return $('#preview').css({
      width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
      height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
      marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
      marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
    });
  };

  return BgCropper;

})();
