$(document).on('turbolinks:load', function () {
  $('.flash').animate({'top':'0px'},500);
  setTimeout(slideout, 3000);
});

var slideout = function(){
  $('.flash').animate({'top':'-66px'},500);
}
