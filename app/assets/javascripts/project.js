$(document).on('turbolinks:load', function () {
  $(".showCourseLink").on("click", function(){
    $("html,body").animate({scrollTop:$('.main__rightContent__title').offset().top});
  });
});
