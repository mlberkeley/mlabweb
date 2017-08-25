//= require owl.carousel

var owl;
owl = function() {
  $(".owl-carousel").owlCarousel({
    nav:true,
    dots:true,
    responsive:{
      0:{
        items:2
      },
      600:{
        items:4
      },
      1000:{
        items:6
      }
    }
  })
};

$(document).on('turbolinks:load', owl());
