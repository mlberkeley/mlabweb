//= require isotope.pkgd.min.js

$(window).on("turbolinks:load", function() {
  var $container = $('#lightbox');
  $container.isotope({
      filter: '*',
      animationOptions: {
          duration: 750,
          easing: 'swing',
          queue: false
      }
  });
  $('.snav-links a').click(function() {
      $('.snav-links .active').removeClass('active');
      $(this).addClass('active');
      var selector = $(this).attr('data_filter');
      $container.isotope({
          filter: selector,
          animationOptions: {
              duration: 750,
              easing: 'swing',
              queue: false
          }
      });
      return false;
  });

});



// var $container = $('#lightbox');
// $container.isotope({
//     filter: '*',
//     animationOptions: {
//         duration: 750,
//         easing: 'swing',
//         queue: false
//     }
// });
//
// var snav_reset;
// snav_reset = function() {
//   $('.snav-links a').click(function() {
//       $('.snav-links .active').removeClass('active');
//       $(this).addClass('active');
//       var selector = $(this).attr('data_filter');
//       $container.isotope({
//           filter: selector,
//           animationOptions: {
//               duration: 750,
//               easing: 'swing',
//               queue: false
//           }
//       });
//       return false;
//   })
// };
//
// $(document).on('turbolinks:load', $container());
// $(document).on('turbolinks:load', snav_reset());
