$(document).ready(function() {

  $("#owl-demo").owlCarousel({

      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      //singleItem:true,

      // "singleItem:true" is a shortcut for:
      items : 3
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false

  });

  $('.average-review-rating').raty({
    readOnly: true,
    path: '/assets/',
    score: function() {
      return $(this).attr('data-score')
    }
  });

  $('.tab-content:not(:first)').hide();
  $('.tabs li a').click(function() {
    $('.tabs li a').removeClass('active');
    $(this).addClass('active');
    $('.tabs li').removeClass('li-active');
    $(this).parent().addClass('li-active');
    $('.tab-content').hide();

    var tab = $(this).attr('href');
    $(tab).fadeIn(600);
    return false;
  });

});

