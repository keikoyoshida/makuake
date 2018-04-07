//modal
$(document).on('turbolinks:load', function () {
  //ログイン
  $(".signIn").on("click", function(){
    var action = "signIn";
    var theOtherAction = "signUp";
    modalController(action, theOtherAction);
  });
  //新規登録
  $(".signUp").on("click", function(){
    var action = "signUp";
    var theOtherAction = "signIn";
    modalController(action, theOtherAction);
  });
});

function modalController(action, theOtherAction){
  $(".modal__bg, .modal__" + theOtherAction).hide() ;
    $(".modal__bg").remove() ;
    $('.modal__content__formErrors').empty();
    //body内の最後に<div id="modal-bg"></div>を挿入
    $("body").append('<div class="modal__bg"></div>');
    //モーダルウィンドウを表示
    $(".modal, .modal__bg, .modal__" + action).fadeIn("slow");
    //画面のどこかをクリックしたらモーダルを閉じる
    $(".modal__bg").on("click", function(){
      $(".modal, .modal__bg, .modal__" + action).fadeOut("slow",function(){
        //挿入した<div id="modal-bg"></div>を削除
        $(".modal__bg").remove() ;
      });
    });
}
