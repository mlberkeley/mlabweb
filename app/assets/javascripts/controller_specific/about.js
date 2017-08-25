//= require owl.carousel

var owl;
owl = function() {
  $(".owl-carousel").owlCarousel({
    lazyLoad:true,
    loop:true,
    dots:true,
    nav:true,
    responsive:{
      0:{
          items:2,
      },
      600:{
          items:3,
      },
      1000:{
          items:4,
      }
  }
  })
};

$(document).on('turbolinks:load', owl());
