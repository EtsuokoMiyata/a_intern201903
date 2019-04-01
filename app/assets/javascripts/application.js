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
//= require jquery
//= require bootstrap
//= require turbolinks
//= require_tree .

//残業申請モーダル用
var pointY;
$(function(){
$(".modal-open").click(function(){
//キーボード操作などにより、オーバーレイが多重起動するのを防止する
$( this ).blur() ;	//ボタンからフォーカスを外す
if( $( "#modal-overlay" )[0] ) return false ;		//新しくモーダルウィンドウを起動しない (防止策1)
//if($("#modal-overlay")[0]) $("#modal-overlay").remove() ;		//現在のモーダルウィンドウを削除して新しく起動する (防止策2)
//背景固定
pointY = $(window).scrollTop();
$('body').css({
'position': 'fixed',
'width': '100%',
'top': -pointY
});
//オーバーレイを出現させる
$( "body" ).append( '<div id="modal-overlay"></div>' ) ;
$( "#modal-overlay" ).fadeIn( "slow" ) ;
//コンテンツをセンタリングする
centeringModalSyncer() ;
//コンテンツをフェードインする
$( "#modal-content" ).fadeIn( "slow" ) ;
//[#modal-overlay]、または[#modal-close]をクリックしたら…
$( "#modal-overlay,#modal-close" ).unbind().click( function(){
//[#modal-content]と[#modal-overlay]をフェードアウトした後に…
$( "#modal-content,#modal-overlay" ).fadeOut( "slow" , function(){
//[#modal-overlay]を削除する
$('#modal-overlay').remove() ;
//背景固定を解除する
releaseScrolling();
} ) ;
} ) ;
} ) ;
//背景固定解除
function releaseScrolling(){
$('body').css({
'position': 'relative',
'width': '',
'top': ''
});
$(window).scrollTop(pointY);
}
//リサイズされたら、センタリングをする関数[centeringModalSyncer()]を実行する
$( window ).resize( centeringModalSyncer ) ;
//センタリングを実行する関数
function centeringModalSyncer() {
//画面(ウィンドウ)の幅、高さを取得
var w = $( window ).width() ;
var h = $( window ).height() ;
// コンテンツ(#modal-content2)の幅、高さを取得
// jQueryのバージョンによっては、引数[{margin:true}]を指定した時、不具合を起こします。
var cw = $( "#modal-content" ).outerWidth( {margin:true} );
var ch = $( "#modal-content" ).outerHeight( {margin:true} );
var cw = $( "#modal-content" ).outerWidth();
var ch = $( "#modal-content" ).outerHeight();
//センタリングを実行する
$( "#modal-content" ).css( {"left": ((w - cw)/2) + "px","top": ((h - ch)/2) + "px"} ) ;
}
} ) ;