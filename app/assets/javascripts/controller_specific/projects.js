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


jQuery(() => new BgCropper());

class BgCropper {
  constructor() {
    this.update = this.update.bind(this);
    this.updatePreview = this.updatePreview.bind(this);
    $('#cropbox').Jcrop({
      aspectRatio: 4.25,
      setSelect: [0, 0, 425, 100],
      onSelect: this.update,
      onChange: this.update
    });
  }

  update(coords) {
    $('#project_crop_x').val(coords.x);
    $('#project_crop_y').val(coords.y);
    $('#project_crop_w').val(coords.w);
    $('#project_crop_h').val(coords.h);
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
