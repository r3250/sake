// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(function(){
      // ▼マウスが載ったらサブメニューを表示
      $("ul.ddmenu li").mouseenter(function(){
         $(this).siblings().find("ul").hide();  // 兄弟要素に含まれるサブメニューを全部消す。
         $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
      });
      // ▼どこかがクリックされたらサブメニューを消す
      $('html').click(function() {
         $('ul.ddmenu ul').slideUp(150);
      });
   });



//page topボタン
$(function(){
   var topBtn=$('#pageTop');
   topBtn.hide();

   //ボタンの表示設定
   $(window).scroll(function(){
      if($(this).scrollTop()>150) {
         //画面を80pxスクロールしたら、ボタンを表示する
         topBtn.fadeIn();
   }else {
         //画面を80pxより上なら、ボタンを表示しない
      topBtn.fadeOut();

   }
   });

   //ボタンをクリックしたら、スクロールして上に戻る
   topBtn.click(function(){
      $('body,html').animate({
         scrollTop: 0},500);
       return false;
   });
});
