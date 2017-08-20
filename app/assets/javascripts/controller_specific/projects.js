//= require jquery.Jcrop
//= require owl.carousel

$(".owl-carousel").owlCarousel({
  nav:true,
});

jQuery(() => new BgCropper());

class BgCropper {
  constructor() {
    this.update = this.update.bind(this);
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
}
