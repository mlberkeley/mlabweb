//= require owl.carousel

var owl;
owl = function() {
  $(".owl-carousel").owlCarousel({
    nav:true,
    items: 2
  })
};

$(document).on('turbolinks:load', owl());
