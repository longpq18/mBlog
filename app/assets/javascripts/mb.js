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
});