$(document).ready(function() {
  $('.list-post li #grid').click(function(){
    $('.posts-details').removeClass('list');
    $('.posts-details').addClass('grid');
    
    $(this).addClass('active');
    $('.list-post li #list').removeClass('active');
  });

  $('.list-post li #list').click(function(){

    $('.posts-details').removeClass('grid');
    $('.posts-details').addClass('list');
    $(this).addClass('active');
    $('.list-post li #grid').removeClass('active');
  });

  // slide

  $("#owl-demo1").owlCarousel({
      navigation : false, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      autoPlay : 5000,
      stopOnHover : true,
      //singleItem:true,

      // "singleItem:true" is a shortcut for:
      items : 1
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false
  });

  $('.grid-view').isotope({
    itemSelector: '.grid-item',
    percentPosition: true,
    masonry: {
      columnWidth: '.grid-sizer'
    }
  });

  /*$('.grid-view .grid-item').each(function(index) {
    index++;

    if(index % 2 == 0) {
      $(this).addClass('grid-item--width2');

    } else if(index % 3 == 0){
      $(this).addClass('grid-item--width2 grid-item--height2');
    }
  });*/
});

(function($) {
    "use strict";

    $(document).ready(function () {
        $('.hk-slick-wrap').find('.hk-posts-default').each(function() {
            $('.hk-posts-wrap', $(this)).slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                fade: false,
                dots: false,
                asNavFor: $('.hk-posts-sider-nav', $(this))
            });
            $('.hk-posts-sider-nav', $(this)).slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                asNavFor: $('.hk-posts-wrap', $(this)),
                dots: false,
                arrows: false,
                centerMode: true,
                focusOnSelect: true,
                autoplay: true,
                autoplaySpeed: 8000,
            });
        });
    });
}(jQuery));

