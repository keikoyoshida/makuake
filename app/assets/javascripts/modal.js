//modal
$(document).on('turbolinks:load', function () {
  //ログインをクリックしたら
  $(".headerIn__nav__list__signIn").on("click", function(){
    //body内の最後に<div id="modal-bg"></div>を挿入
    $("body").append('<div class="modal__bg"></div>');
    //モーダルウィンドウを表示
    $(".modal, .modal__signIn, .modal__bg").fadeIn("slow");
    //画面のどこかをクリックしたらモーダルを閉じる
    $(".modal__bg").on("click", function(){
      $(".modal, .modal__signIn, .modal__bg").fadeOut("slow",function(){
        //挿入した<div id="modal-bg"></div>を削除
        $(".modal__bg").remove() ;
      });
    });
  });
});
