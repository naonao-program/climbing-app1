$(function(){
  $('.header-ul li a').each(function(){
    var target = $(this).attr('href');
    if(location.href.match(target)) {
      $(this).parent().addClass('color');
    } else {
      $(this).parent().removeClass('color');
    }
  });
});