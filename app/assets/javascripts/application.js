//= require jsF/jquery-1.11.0.min
//= require jsF/bootstrap.min
//= require jsF/bootstrap-hover-dropdown.min
//= require jsF/owl.carousel.min
//= require jsF/jquery.parallax-1.1.3
//= require jsF/jquery.nicescroll
//= require jsF/jquery.prettyPhoto
//= require jsF/jquery-ui-1.10.4.custom.min
//= require jsF/jquery.jigowatt
//= require jsF/jquery.sticky
//= require jsF/waypoints.min
//= require jsF/jquery.isotope.min
//= require jsF/jquery.gmap.min
//= require rs-plugin/js/jquery.themepunch.plugins.min
//= require rs-plugin/js/jquery.themepunch.revolution.min
//= require jsF/custom
//= require jsF/login
//= require jquery_ujs
//= require availability-calendar


$('.translation-links a').click(function() {
                  var lang = $(this).data('lang');
                  var $frame = $('.goog-te-menu-frame:first');
                  if (!$frame.size()) {
                    alert("Error: Could not find Google translate frame.");
                    return false;
                  }
                  $frame.contents().find('.goog-te-menu2-item span.text:contains('+lang+')').get(0).click();
                  return false;
                });





























