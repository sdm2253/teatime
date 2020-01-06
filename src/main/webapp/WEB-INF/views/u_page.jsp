<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
<spring:url value="/resources/css/postcss.css" var="postcss" />
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
.u_find {
   margin-left: 10px;
   margin-right: 10px;
   text-align: center;
}

.user_find {
   width: 250px;
   height: 80px;
   padding: 5px 5px;
   margin: 8px 0;
   box-sizing: border-box;
   border: 2px solid #6799FF;
   border-radius: 4px;
}

.u_find_btn {
   display: inline-block;
   border-radius: 4px;
   background-color: #6799FF;
   border: none;
   color: #FFFFFF;
   text-align: center;
   font-size: 20px;
   height: 40px;
   width: 200px;
   transition: all 0.5s;
   cursor: pointer;
   margin: 5px;
}

.u_find h3 {
   width: 250px;
   height: 45px;
   margin-left: auto;
   margin-right: auto;
   color: #fff;
   font-size: 14px;
   line-height: 45px;
   background-color: #495164;
}

.u_info {
   margin-left: 10px;
   margin-right: 10px;
   text-align: center;
}

.u_info h3 {
   width: 250px;
   height: 45px;
   margin-left: auto;
   margin-right: auto;
   color: #fff;
   font-size: 14px;
   line-height: 45px;
   background-color: #495164;
   margin-bottom: 15px;
   margin-top: 15px;
}

.u_info_table {
   width: 300px;
   height: 180px;
   border-collapse: separate;
   border: solid #495164 3px;
   border-radius: 6px;
   -moz-border-radius: 6px;
   border-spacing: 0px;
   margin-left: auto;
   margin-right: auto;
}

.u_info_table td {
   width: 70px;
   word-break: break-all;
   font-size: 0.7em
}

.u_info_table th {
   font-size: 0.5em
}

.u_info_table input[type="button"] {
   display: inline-block;
   border-radius: 4px;
   background-color: #6799FF;
   border: none;
   color: #FFFFFF;
   text-align: center;
   font-size: 15px;
   height: 30px;
   width: 200px;
   transition: all 0.5s;
   cursor: pointer;
   margin: 5px;
}
</style>
<meta charset="UTF-8">
<title>Tea Time</title>


<link rel="stylesheet" href="${postcss }"></link>

<style>
.post-image {
   height: auto;
   min-height: 200px;
   display: block;
}

.postpp {
   border: 1px solid black;
   border-radius: 3px;
}
/*
.replyList {
   position: fixed;
   font-family: Arial, Helvetica, sans-serif;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   background: rgba(0,0,0,0.8);
   z-index: 99999;
   opacity:0;
   -webkit-transition: opacity 400ms ease-in;
   -moz-transition: opacity 400ms ease-in;
   transition: opacity 400ms ease-in;
   pointer-events: none;
   
   }
   
    .replyList:target {
   opacity:1;
   pointer-events: auto;
   }

   .replyList > div.test {
   width: 400px;
   position: relative;
   margin: 10% auto;
   padding: 5px 20px 13px 20px;
   border-radius: 10px;
   background: #fff;
   background: -moz-linear-gradient(#fff, #999);
   background: -webkit-linear-gradient(#fff, #999);
   background: -o-linear-gradient(#fff, #999);
   }  
   .close {
   background: #606061;
   color: #FFFFFF;
   line-height: 25px;
   position: absolute;
   right: -12px;
   text-align: center;
   top: -10px;
   width: 24px;
   text-decoration: none;
   font-weight: bold;
   -webkit-border-radius: 12px;
   -moz-border-radius: 12px;
   border-radius: 12px;
   -moz-box-shadow: 1px 1px 3px #000;
   -webkit-box-shadow: 1px 1px 3px #000;
   box-shadow: 1px 1px 3px #000;
   }

   .close:hover { background: #00d9ff; }
   
   .repliesTable {
      width: 100%;
      overflow-y: auto;
   }
   
   .replyButtonsTable .table2{
      height: 20px;
   }
   #reply-list-container {
      
      display: block;
      overflow-y: auto;
      height: 200px;
      width: 100%;
      
   }
   #reply-list-container th, #reply-list-container td, #reply-list-container tr {
      text-align: center;
      word-break:break-all;
   }
   .repliesTable .table1 {
      text-align: center;
      margin: 0 auto;

   }
   .reply-list-big-container {
      text-align: center;
      margin: 0 auto;
   }
   .appendedTr {
      text-align: center;
      word-break:break-all;
      width: 400px;
   }
   .appendedTd {
      text-align: center;
      word-break:break-all;
      width: 400px;
   }
   */
textarea {
   resize: none;
}

body {
   width: 1950px;
   height: 100%;
   overflow-y: auto;
}

.wrapper {
   width: 100%;
   height: 100%;
}

.main-wrapper {
   width: 100%;
   height: 100%;
   display: flex;
   flex-flow: row;
}

.info-container {
   order: 1;
   display: flex;
   flex-flow: column;
   width: 20%;
   background-color: #E6E6E6;
   text-align: center;
   border-right-style: solid;
   border-right-width: 5px;
   border-color: #CCCCCC;
}

.user-name {
   margin-top: 10%;
}

.info-member-name {
   width: 6em;
}

.member-name {
   width: 5em;
}

.profile-pic {
   margin-top: 10%;
   display: block;
   margin-left: auto;
   margin-right: auto;
   width: 80%;
   height: 400px;
   border: 1px solid #2F4F4F;
}

.user-info {
   margin-top: 20%;
   text-align: center;
}

.user-info {
   font-size: 20pt;
   text-align: center;
}

.user-info table {
   border-collapse: collapse;
   text-align: center;
}
.user-info table tr, .user-info table td, .user-info table th {
   font-size: 16pt;
}

.user-info table td, user-info table th {
   border: 1px solid #2F4F4F;
   padding: 4px;
}

.user-info table tr:first-child td {
   border-top: 0;
}

.user-info table tr:last-child td {
   border-bottom: 0;
}

.user-info table tr td:first-child, .user-info table tr th:first-child {
   border-left: 0;
}

.user-info table tr td:last-child, .user-info table tr th:last-child {
   border-right: 0;
}

.friend-button {
   margin-top: 20%;
   text-align: center;
}

.removeFriendButton {
   background-color: white;
   color: black;
   border: 2px solid #e7e7e7;
}

.cancelFriendButton {
   background-color: white;
   color: black;
   border: 2px solid #e7e7e7;
}

.addFriendButton {
   background-color: #33CCFF;
   color: black;
   border: 2px solid #e7e7e7;
}

.cancelFriendButton:hover {
   background-color: #EE4466;
   color: white;
}

.removeFriendButton:hover {
   background-color: #EE4466;
   color: white;
}

.addFriendButton:hover {
   background-color: #8ec3eb;
}

.button {
   background-color: #73E600;
   border: none;
   color: white;
   padding: 16px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 18px;
   margin: 4px 2px;
   transition-duration: 0.4s;
   cursor: pointer;
   border-radius: 6px;
}

.middle-section-container {
   order: 2;
   display: flex;
   flex-flow: column;
   margin-top: 1%;
   width: 60%;
}
/*
.post-container {
   order: 1;
}
.post-container table {
   width: 70%;
   height: 16em;
   border-spacing: 0.2em;
   border-collapse: seperate;
   table-layout: fixed;
}
.post-container table th {
   padding: 0.5em;
   font-size: 16pt;
}
.post-container table td {
   padding: 0.5em;
   font-size: 12pt;
}
*/
.post {
   margin-top: 5%;
}

.loader {
   margin-top: 10%;
   order: 2;
   text-align: center;
   font-size: 14pt;
}

.friend-request-container {
   order: 3;
   right: 0%;
   width: 20%;
   background-color: #E6E6E6;
   text-align: center;
   align-content: center;
   border-left-style: solid;
   border-left-width: 5px;
   border-color: #CCCCCC;
   font-size: 14pt;
}

.no-friend-request-container {
   margin: 0 auto;
   margin-top: 30%;
   border: 3px solid black;
   width: 90%;
   height: 400px;
   text-align: center;
   line-height: 300%;
   font-weight: bold;
}

.friend-request-list {
   margin: 0 auto;
   margin-top: 10%;
   height: 3em;
   width: 100%;
   border-bottom-style: solid;
   border-bottom-width: 5px;
   border-color: #CCCCCC;
   font-size: 16pt;
   text-align: center;
   line-height: 1.5em;
}

.friend-request-box {
   display: flex;
   flex-flow: row;
   margin: 0 auto;
   margin-top: 10%;
   padding: 0.2em;
   width: 90%;
   height: 3em;
   background-color: #B0C4DE;
   border: 3px solid #4682B4;
   border-radius: 2px;
   font-size: 14pt;
   text-align: left;
}

.request-pic {
   order: 1;
   margin-left: 0;
   border: 1px solid black;
   border-radius: 2px;
}

.request-name3 {
   order: 2;
   height: 100%;
   width: 50%;
   margin-left: 1em;
}

.request-name4 {
   color: black;
   font-size: 18pt;
   line-height: 2em;
}

.request-name4:hover {
   text-decoration: underline;
}

.accept-friend-button {
   order: 3;
}

.acceptFriendButton {
   background-color: #73E600;
   width: 4em;
   height: 90%;
   font-size: 11pt;
   margin: 0.3em;
   border-radius: 4px;
   padding: 0;
}

.acceptFriendButton:hover {
   border: solid blue 1px;
}

.reject-friend-button {
   order: 4;
}

.rejectFriendButton {
   background-color: #FF4136;
   width: 4em;
   height: 90%;
   font-size: 11pt;
   margin: 0.3em;
   border-radius: 4px;
   padding: 0;
}

.rejectFriendButton:hover {
   border: solid blue 1px;
}
</style>

<script>
var snum = 5;
var page_no = 0;
var re_no = 0;
//새로고침 했을때 해당 게시물 댓글 그대로 유지 함수
$(document).ready(function() {
   var url = $(location).attr('href'),
   parts = url.split("#"),
   last_part = parts[parts.length-1]; //replyShow0
   var replyNum = last_part.replace(/[^0-9]/g,"");
   console.log(replyNum);
   getComment(replyNum);
});


function replyClose(num) {
    var vid = num;
     console.log("fIndex : " +vid);
     $("#replyList"+vid).empty();
     $("#r_content"+vid).val("");
     $("#moreBtn"+vid).remove();
     $(".replyTag"+vid).hide();
      //댓글 창 종료시 더보기에 사용되는 변수 초기화
}


//=====================================================
//댓글창 열고 닫기
//$(function(){
   $(document).off().on('click', '.replyBtn', function(){
   //$('.replyBtn').click(function(){
        var vid = $(this).attr("id");
       $("#replyList"+vid).empty();
        console.log("fIndex : " +vid);
        $(".replyTag"+vid).show();
        getComment(vid);
        snum = 5;
   });
   


//=================================================
   //댓글 추가 하기 함수
$(document).on('click', '.addBtn', function(){
       var bid = $(this).attr("id");
       console.log(bid);
       $.ajax({
          type:'POST',
             url : "addComment",
          data: $("#replyForm"+bid).serialize(),
          success : function(data){
                   alert("ajax 성공!");
                   $("#replyList"+bid).empty();
                   snum=5;
                   getComment(bid);
                 $("#r_content"+bid).val("");
          },
          error:function(){
              $("#r_content"+bid).val("");
                alert("댓글을 입력 바랍니다.");
          }   
      });
});

   //댓글 불러오기 함수
   function getComment(num){ 
      $.ajax({
         type:'POST',
          url : "getComment",
          data: $("#replyForm"+num).serialize()+"&re_no="+re_no,
          success : function(data){
            $("#moreBtn"+num).remove(); 
             console.log(data);
             if(data.length > 0){ 
                if(data.length > 4){
                   $("#replyList"+num).after(
                     "<tr id='moreBtn"+num+"'><td colspan='3'><input type='button' onclick='moreComment("+num+");' value='더보기'></td></tr>");
                }
                for(i=0; i<data.length; i++){      
                   var id = data[i].m_id;
                   var content = data[i].r_content;
                   var date = data[i].r_date;
                   var like = data[i].r_like;
                   var pic = data[i].r_pic;
                   var rnum = data[i].r_num;
                   var idgroup = data[i].r_idgroup;
                   console.log(pic);
                    $("#replyList"+num).append (
                       "<tr>" +
                       "<td><img src='img/"+pic+"' id='profile'></td>"+
                       "<td width='100%' style='word-break:break-all;'>"+"<b>"+id+"</b><br>"+content+"</td>"+
                       "<td width='200px'>"+date+"</td>"+
                       "<td>"+like+"</td>"+
                       "<td id='replyDelete"+i+"'></td>"+
                       "</tr>"
                     );
                    
                    if(id=="${mid}"){
                       $("#replyDelete"+i).append (
                        "<input type='button' value='X' onclick='reDelete("+rnum+","+num+","+idgroup+")'>");
                    }
                   
                 }
         }
          },
          error:function(){
             alert("에러 발생."); 
          }    
       });
     }

// 댓글 삭제 함수
function reDelete(rnum,num,idgroup) {
    console.log(rnum);
    $.ajax({
      type:'POST',
      url : "replyDelete",
      data: {r_num : rnum ,
         r_idgroup : idgroup},
      success : function(data){
         alert("댓글 삭제 완료!"); 
         $("#replyList"+num).empty();
           snum=5;
         getComment(num);
      },
       error:function(){
          alert("댓글 삭제 에러 발생."); 
       }    
    });   
      
}

//더보기 버튼
function moreComment(num){ 
   console.log(snum);
   $.ajax({
      type:'POST',
       url : "getComment",
       data: $("#replyForm"+num).serialize()+"&re_no="+snum,
       success : function(data){
          //console.log(data);
          snum+= 5; //다음 댓글 5개를 가져오기 위한 변수 증가
          if(data.length > 0){
             for(i=0; i<data.length; i++){      
               var id = data[i].m_id;
               //console.log(data[i].m_id);
               var content = data[i].r_content;
               var date = data[i].r_date;
               var like = data[i].r_like;
               var pic = data[i].r_pic;
               var rnum = data[i].r_num;
               var idgroup = data[i].r_idgroup;
                  
                  $("#replyList"+num).append (
                  "<tr>" +
                  "<td><img src='img/"+pic+"' id='profile'></td>"+
                  "<td width='100%'style='word-break:break-all;'><b>"+id+"</b><br>"+content+"</td>"+
                  "<td width='200px'>"+date+"</td>"+
                  "<td>"+like+"</td>"+
                  "<td id='replyDelete2"+i+"'></td>"+
                  "</tr>"
                  );
                  if(id=="${mid}"){
                      $("#replyDelete2"+i).append (
                       "<input type='button' value='X' onclick='reDelete("+rnum+","+num+","+idgroup+")'>");
                   }
                 }
          }else {
             alert("마지막 댓글 입니다.");          
          }
          
        },
       error:function(){
          alert("에러 발생."); 
       }    
    });   
}

//좋아요 함수
function p_like(p_idgroup){
   var idgroup = p_idgroup
    
    var p_dto = {
          m_id : '${mid}',
          p_idgroup : idgroup
    }
    
    $.ajax({
       url:"like_up",
       type:"POST",
       data: p_dto,
       dataType: "json",
       success: function(data){
          if(data.chk==0){
             $('#lcount'+idgroup).text(data.lcount);
           
          }else if(data.chk==1){
            // alert("좋아요 취소.")
           $('#lcount'+idgroup).text(data.lcount);
             console.log("1")
            
          }else if(data.chk==2){
            // alert("좋아요 초기 올리기 성공.")
            $('#lcount'+idgroup).text(data.lcount);
             console.log("2")
          
          }
          
         
           $('.p_btn_class[onload]').trigger('onload');
   
       },
        error:function(){
           alert("문제가 발생 하였습니다.")
       }
    });
}
 

//----------------------------------------------
   $(function(idgroup){
      $('.p_btn_class[onload]').trigger('onload');
   });
         
         var btn="#btn"
         
function p_like_btn(idgroup){
   

   var form = {
         m_id : '${mid}',
         p_idgroup : idgroup
   }
   $.ajax({
   url: "p_like_btn",
   type: "POST",
   data: form,
   success: function(data) {
      console.log("아이디 그룹 :"+idgroup);
      console.log(data)
      console.log(data.chk)
      console.log("아이디 그룹 서버에서 응답 :" + data.idgroup);
      if(data.chk==1){
         $("#btn"+idgroup ).css({
         color: "red"
         });
      }else if(data.chk==0){
         $("#btn"+idgroup ).css({
            color: "black"
         });
      }else{
         $("#btn"+idgroup ).css({
            color: "black"
         });
      }
   },
   error: function() {
      alert("에러@")      
   }
   });
}

/*
//좋아요 함수
function p_like(p_idgroup){
   var idgroup = p_idgroup
    var p_dto = {
          m_id : '${mid}',
          p_idgroup : idgroup
    }
    
    $.ajax({
       url:"like_up",
       type:"POST",
       data: p_dto,
       dataType: "json",
       success: function(data){
          if(data.chk==0){
             $('#lcount'+idgroup).text(data.lcount);
             location.href='u_page?u_id=${param.u_id}';
          }else if(data.chk==1){
            // alert("좋아요 취소.")
           $('#lcount'+idgroup).text(data.lcount);
             console.log("1")
             location.href='u_page?u_id=${param.u_id}';
          }else if(data.chk==2){
            // alert("좋아요 초기 올리기 성공.")
            $('#lcount'+idgroup).text(data.lcount);
             console.log("2")
             location.href='u_page?u_id=${param.u_id}';
          }
          
          $(function(id, idgroup){
           $('.p_btn_class[onload]').trigger('onload');
        });
          
       },
        error:function(){
           alert("문제가 발생 하였습니다.")
       }
    });
}
 

//----------------------------------------------
   $(function(id, idgroup){
      $('.p_btn_class[onload]').trigger('onload');
   });
         
         var btn="#btn"
         function p_like_btn(idgroup){
         
            var form = {
                  m_id : '${mid}',
                  p_idgroup : idgroup
            }
            $.ajax({
               url: "p_like_btn",
            type: "POST",
            data: form,
            success: function(data) {
               console.log("아이디 그룹 :"+idgroup);
               console.log(data)
               console.log(data.chk)
               console.log("아이디 그룹 서버에서 응답 :" + data.idgroup);
               if(data.chk==1){
                  $("#btn"+idgroup ).css({
                     color: "red"
                  });
               }else if(data.chk==0){
                  $("#btn"+idgroup ).css({
                     color: "black"
                  });
               }else{
                  $("#btn"+idgroup ).css({
                     color: "black"
                  });
               }
            },
            error: function() {
               
            }
         });
         }

*/
</script>

<style>
<!--
게시글 스타일 -->.post-container {
   order: 1;
}

.post-container table {
   width: 70%;
   border-collapse: seperate;
}

.post-container table th {
   padding: 0.5em;
   font-size: 16pt;
}

.post-container table td {
   padding: 0.5em;
   font-size: 12pt;
}

.post-container {
   margin-top: 5%;
}

#profile {
   width: 40px;
   height: 40px;
   object-fit: cover;
   border-radius: 50%;
}

#friendPic {
   width: 40px;
   height: 40px;
   object-fit: cover;
   border-radius: 50%;
}

textarea[id^=r_content] {
   overflow-y: hidden;
   background: clear;
   font-size: 14px;
}

td, th {
   font-size: 10px;
}

div[class^=replyTag] {
   visibility: none;
}

.replyShow1 {
   position: fixed;
   font-family: Arial, Helvetica, sans-serif;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   background: rgba(0, 0, 0, 0.8);
   z-index: 99999;
   opacity: 0;
   -webkit-transition: opacity 400ms ease-in;
   -moz-transition: opacity 400ms ease-in;
   transition: opacity 400ms ease-in;
   pointer-events: none;
}

.replyShow1:target {
   opacity: 1;
   pointer-events: auto;
}

.replyShow1>div {
   width: 600px;
   position: relative;
   margin: 10% auto;
   padding: 5px 20px 13px 20px;
   border-radius: 10px;
   background: #fff;
   background: -moz-linear-gradient(#fff, #999);
   background: -webkit-linear-gradient(#fff, #999);
   background: -o-linear-gradient(#fff, #999);
}

.close {
   background: #606061;
   color: #FFFFFF;
   line-height: 25px;
   position: absolute;
   right: -12px;
   text-align: center;
   top: -10px;
   width: 24px;
   text-decoration: none;
   font-weight: bold;
   -webkit-border-radius: 12px;
   -moz-border-radius: 12px;
   border-radius: 12px;
   -moz-box-shadow: 1px 1px 3px #000;
   -webkit-box-shadow: 1px 1px 3px #000;
   box-shadow: 1px 1px 3px #000;
}

.close:hover {
   background: #00d9ff;
}

.overf {
   overflow: auto;
}

.ovr {
   display: block;
   width: 400px;
   height: 350px;
   overflow-y: auto;
}

.postForm {
   margin-top: 3.5%;
   border-collapse: separate;
   border: solid #495164 3px;
   border-radius: 1px;
   border-spacing: 0px;
   -moz-border-radius: 1px;
   border-spacing: 0px;
   margin-left: auto;
   margin-right: auto;
   table-layout: fixed;
   vertical-align: middle;
}

.postForm td {
   border-right: 2px solid #495164;
   border-bottom: 2px solid #495164;
}

.postForm th {
   border-right: 2px solid #495164;
   border-bottom: 2px solid #495164;
}

.re_td {
   text-align: center;
   margin-left: auto;
   margin-right: auto;
}

.p_btn_class {
   width: 150px;
   height: 35px;
}

.btn_td {
   margin-top: auto;
   margin-bottom: auto;
   text-align: center;
}

.replyBtn {
   padding-top: 20px;
   display: inline-block;
   border-radius: 4px;
   background-color: #6799FF;
   border: none;
   color: #FFFFFF;
   text-align: center;
   font-size: 15px;
   height: 60px;
   width: 500px;
   transition: all 0.5s;
   cursor: pointer;
   margin: 5px;
}

.center h3 {
   text-align: center;
   margin-top: 20px;
   height: 45px;
   margin-left: 150px;
   margin-right: 150px;
   color: #fff;
   font-size: 14px;
   line-height: 45px;
   background-color: #495164;
   margin-bottom: 15px;
}
</style>

<script>

   var u_id = "${param.u_id}";
   var isFriend = ${isFriend};
   var sessionId = '${mid}';
   var sessId = String(sessionId);
   var flag = true;
   var replyCounter = 2;
   var repliesArray = new Map();
   
   $(document).ready(function(){
      
      $('.loader').hide();
      $('.replyLineClass').hide();
      $('.closeReplies').hide();
      
      if (u_id == sessionId) {
         location.href="mypage";
      }
      
      if (isFriend == 0) {
         $('#sendFriend').show();
         $('#cancelFriend').hide();
         $('#removeFriend').hide();
      } else if (isFriend == 1) {
         $('#sendFriend').hide();
         $('#cancelFriend').show();
         $('#removeFriend').hide();
      } else if (isFriend == 2) {
         $('#sendFriend').hide();
         $('#cancelFriend').hide();
         $('#removeFriend').show();
      }
      /*
         $.ajax({
            url: "show_more_user_posts",
            type: "POST",
            data: {'u_id':u_id},
            dataType: "JSON",
            cache: false,
            success: function(data) {
               if (!data.morePosts) {
                  $('.loader').show();
               }
            },
            error: function(){
               
            }
         
      });
      */
   });
   
   
   
   $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        scrollT = scrollTop;
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        if( scrollTop + windowHeight == documentHeight ){
           
         flag = true;
         $('.loader').show();
         console.log("00000000000000000");
         $.ajax({      
            url: "show_more_user_posts",
            type: "POST",
            data: {'u_id':u_id},
            dataType: "JSON",
            success: function(data) {      
               if (flag && data.morePosts) {
                  flag = false;
               
                  $('.loader').hide();
                     if (data != null) {
                     
                     $(".post-container").append(  
                           "<table class='postForm'><tr>"+
                                "<tr >"+
                                "<th colspan='1' class='title_td'>제목</th>"+
                                "<td colspan='3' align='center'>"+data.post.p_title+"</td>"+
                                "</tr>"+
                                 
                                
                           "<tbody class='post-image"+data.post.p_num+"'></tbody>"+
                           
                                "<tr >"+
                                "<th colspan='1' class='title_td'>카테고리</th>"+
                                "<td colspan='1' align='center'>"+data.post.p_cat+"</td>"+
                                "<th colspan='1' class='title_td'>해시</th>"+
                                "<td colspan='1'>"+data.post.p_hash+"</td>"+
                                "<tr >"+
                                   "<td colspan='2' class='btn_td'>"+
                                   "<button onload='p_like_btn("+data.post.p_idgroup+")' id='btn"+data.post.p_idgroup+"' class='p_btn_class' onclick='p_like("+data.post.p_idgroup+")' >좋아요 : <label id='lcount"+data.post.p_idgroup+"'>"+data.post.p_like+"</label></button>"+
                                   "</td>"+
                                   "<th colspan='1' class='title_td'>작성자</th>"+
                                    "<td colspan='1' align='center'>"+data.post.m_id+"</td>"+
                                "</tr>"+
                                "<tr >"+
                                    "<td colspan='4' class='re_td' align='center'>"+
                                    "<div class='replyBtn' OnClick=location.href='#replyShow"+data.post.p_idgroup+"' id='"+data.post.p_idgroup+"' value='"+data.post.m_id+"'>댓글 "+data.post.p_rCount+"개 모두 보기</div></td>"+     
                                "</tr>"+"</table>"+
                           "<div id='replyShow"+data.post.p_idgroup+"' class='replyShow1' height='500px'>"+
                                "<div class='replyTag"+data.post.p_idgroup+"'>"+
                                "<a href='#Close' title='Close' class='close' onclick='replyClose("+data.post.p_idgroup+")';>X</a>"+
                                "<table id='replyTable' width='300px' height='500px'>"+
                                "<tbody id='replyList"+data.post.p_idgroup+"' class='ovr' ></tbody></table>"+
                                "<div id='inputReply$"+data.post.p_idgroup+"' style='height: 100px'>"+
                                "<table border='1' id='replyInput'>"+
                                    "<tr>"+
                                    "<td ><img  src='img/${proImg}' id='profile'></td>"+
                                    "<td><b>${mid}</b><br>"+
                                    "<form id='replyForm"+data.post.p_idgroup+"' method='post' class='r_form'>"+
                                       "<textarea id='r_content"+data.post.p_idgroup+"' name='r_content' placeholder='댓글 달기...' style='width: 200px; height: 30px'></textarea>"+
                                       "<input type='hidden' name='r_idgroup' value='"+data.post.p_num+"'>"+
                                       "<input type='hidden' name='r_pic' value='${proImg}'>"+
                                       "<input class='addBtn' id='"+data.post.p_idgroup+"' type='button' value='게시' style='height: 50px; width: 80px;'>"+
                                    "</form>"+
                                       "</td>"+
                                       "</tr>"+
                                 "</table>"+
                                  "</div>"+
                             "</div><br>");
                     p_like_btn(data.post.p_idgroup);

                     
                     
                      if (data.post.p_img != 'null') {
                                $(".post-image"+data.post.p_num).append(
                                   "<tr>"+
                                   "<td colspan='2' style=' border-right:0px;' align='center'><img src='img/"+data.post.p_img+"' width='150px' height='150px'></td>"+
                                     "<td colspan='2' align='center' style='width: 650px; height: 200px;'>"+data.post.p_content+"</td>"+
                                     "</tr>");
                             } else {
                                $(".post-image"+data.post.p_num).append(
                                    "<tr>"+
                                    "<td colspan='4' align='center' style='width: 650px; height: 200px;'>"+data.post.p_content+"</td>"+
                                      "</tr>");
                             }
                            $(document).ready(function() {
                                $("[class^=replyTag]").hide();
                            });     
                            $('.p_btn_class[onload]').trigger('onload');
                            
                            
                     
                     //createReplyArray(data.post.p_idgroup);
                     //$('.replyLineClass').hide();
               
                  } else {
                     alert("더이상 글이 없습니다");
                     $('.loader').show();
                  }
               }
            },
            error: function(data) {
               flag = true;
               $('.loader').hide();
               alert("Error")
            }
         });
      }
   });
   
   
   

   function sendFriend(button){
      $.ajax({
         url: "u_page_friendsend",
         type: "POST",
         data: {'u_id':u_id},
         success: function(data) {
            /*
            $('#sendFriend').removeClass('button sendFriendButton').addClass('button cancelFriendButton');
            $('#sendFriend').html('친구취소');
            */
            $('#sendFriend').hide();
            $('#cancelFriend').show();
            alert("친구 요청 보냈습니다")
         },
         error: function(){
            alert("문제가 발생 됐습니다.");
         }
      });
   }
   
   function cancelFriend(){
      $.ajax({
         url: "u_page_friendCancel",
         type: "POST",
         data: {'u_id':u_id},
         success: function(){
            $('#cancelFriend').hide();
            $('#sendFriend').show();
            alert("친구 요청 취소했습니다")
         }
      });
   }
   function removeFriend(){
      $.ajax({
         url: "u_page_friendRemove",
         type: "POST",
         data: {'u_id':u_id},
         success: function(data){
            $('#removeFriend').hide();
            $('#sendFriend').show();
            alert("친구를 삭제했습니다")
         },
         error: function(){
            alert("문제가 발생 하였습니다.");
         }
      });
   }
   
   function acceptFriend(m_id){
      
      $.ajax({
         url: "u_page_friendAccept",
         type: "POST",
         data: {'m_id': m_id},
         success: function(data){
            $('#friendBox'+m_id).hide();
            alert(m_id);
            alert("Friend Accept Success, data: " + data);
         },
         error: function(){
            alert("문제가 발생 하였습니다.");
         }
      });
   }
   function rejectFriend(m_id){
         
         $.ajax({
            url: "u_page_friendReject",
            type: "POST",
            data: {'m_id': m_id},
            success: function(data){
               $('#friendBox'+m_id).hide();
               alert(m_id);
               alert("Friend Accept Success, data: " + data);
            },
            error: function(){
               alert("문제가 발생 하였습니다.");
            }
         });
      }
   
</script>




</head>

<jsp:include page="/WEB-INF/views/header/m_header.jsp" />

<div class="wrapper">

   <div class="main-wrapper">

      <div class="info-container">
         <span class="user-name">${member.m_id} 님</span> <img
            class="profile-pic" src="img/${member.m_pic }" />
         <div class="user-info">
            <table align="center" class="user-info-table"> 
               <c:choose>
                  <c:when test="${isFriend == 2 }">
                     <tr>
                        <td>회원 이름</td>
                        <td>${member.m_name }</td>
                     </tr>
                     <tr>
                        <td>성별</td>
                        <td>${member.m_strgender }</td>
                     </tr>
                     <tr>
                        <td>생년월일</td>
                        <td>${member.m_idnum }</td>
                     </tr>
                     <tr>
                        <td>연락처</td>
                        <td>${member.m_tel }</td>
                     </tr>
                     <tr>
                        <td>이메일</td>
                        <td>${member.m_mail }</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td class="info-member-name">회원 이름</td>
                        <td class="member-name">${member.m_name }</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </table>
         </div>
         <div class="friend-button">
            <button id="removeFriend" class="button removeFriendButton"
               onclick="removeFriend(this)">친구삭제</button>
            <button id="cancelFriend" class="button cancelFriendButton"
               onclick="cancelFriend(this)">친구취소</button>
            <button id="sendFriend" class="button sendFriendButton"
               onclick="sendFriend(this)">친구추가</button>
         </div>

      </div>

      <div class="middle-section-container">



         <div class="container">
            <div class="post-container">

               <c:forEach var="post" items="${userPosts }" begin="0" end="2">

                  <table class="postForm">
                     <tr>
                        <th colspan="1" class="title_td">제목</th>
                        <td colspan="3" style="table-layout: fixed; width: 75%;"
                           align="center">${post.p_title }</td>
                     </tr>
                     <!-- ============ POST PICTURE PART ============ -->
                     <c:choose>
                        <c:when test="${post.p_img != 'null'}">
                           <tr>
                              <td colspan="2" style="border-right: 0px;" align="center"><img
                                 src="img/${post.p_img }" width="150px" height="150px"></td>
                              <td colspan="2" align="center"
                                 style="width: 650px; height: 200px;">${post.p_content }</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="4" align="center"
                                 style="width: 650px; height: 200px;">${post.p_content }</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                     <!-- =========================================== -->
                     <tr>
                        <th colspan="1" style="width: 50px;" class="title_td">카테고리</th>
                        <td colspan="1" align="center">${post.p_cat }</td>
                        <th colspan="1" class="title_td">해시</th>
                        <td colspan="1" style="text-align: center">${post.p_hash }</td>
                     </tr>
                     <tr>
                        <td colspan="2" class="btn_td"
                           style="table-layout: fixed; width: 25%;">
                           <button onload="p_like_btn(${post.p_idgroup })"
                              id="btn${post.p_idgroup }" class="p_btn_class"
                              onclick="p_like(${post.p_idgroup })">
                              좋아요 : <label id="lcount${post.p_idgroup }">${post.p_like }</label>
                           </button>
                        </td>
                        <th colspan="1" class="title_td">작성자</th>
                        <td colspan="1" align="center">${post.m_id }
                     </tr>
                     <tr>
                        <td colspan="4" align="center" class="re_td">
                           <div class="replyBtn"
                              OnClick="location.href='#replyShow${post.p_idgroup} '"
                              id="${post.p_idgroup}" value="${mid}">댓글 ${post.p_rCount }개
                              모두 보기</div>
                        </td>
                     </tr>
                  </table>

                  <div id="replyShow${post.p_idgroup}" class="replyShow1"
                     height="500px">
                     <div class="replyTag${post.p_idgroup}" id="test">
                        <a href="#Close" title="Close" class="close"
                           onclick="replyClose(${post.p_idgroup});">X</a>
                        <table id="replyTable" width="300px" height="500px">
                           <tbody id="replyList${post.p_idgroup}" class="ovr"></tbody>
                        </table>

                        <div id="inputReply${post.p_idgroup}" style="height: 100px;">
                           <table border="1" id="replyInput">
                              <tr>
                                 <td><img src="img/${proImg}" id="profile"></td>
                                 <td><b>${mid}</b><br>
                                    <form id="replyForm${post.p_idgroup}" method="post"
                                       class="r_form">
                                       <textarea id="r_content${post.p_idgroup}" name="r_content"
                                          placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
                                       <input type="hidden" name="r_idgroup" value="${post.p_num}">
                                       <input type="hidden" name="r_pic" value="${proImg }">
                                       <input class="addBtn" id="${post.p_idgroup}" type="button"
                                          value="게시" style="height: 50px; width: 80px;">
                                    </form></td>
                              </tr>
                           </table>
                        </div>
                     </div>
                     <br>
                  </div>

               </c:forEach>



            </div>
         </div>
         <div class="loader">글이 더이상 없습니다</div>

      </div>

      <div class="friend-request-container">
         <!-- 
         <c:choose>
         <c:when test="${noFriendRequests == true }">
            <div class="no-friend-request-container">
               현재 친구 요청이 없습니다
            </div>
         </c:when>
         <c:otherwise>
            
            <div class="friend-request-list">친구 요청</div>
            <c:forEach var="friendRequest" items="${friendRequests }">
               <div class="friend-request-box" id="friendBox${friendRequest.m_id}">
               <img class="request-pic" src="img/${friendRequest.m_pic }" width="20%" height="90%">
               <div class="request-name3">
                  <a class="request-name4" href="u_page?u_id=${friendRequest.m_id}">
                  ${friendRequest.m_name }
                  </a>
               </div>
                  <div class="accept-friend-button">
                  <button id="acceptFriend" class="button acceptFriendButton" 
                     onclick="acceptFriend('${friendRequest.m_id}')">확인</button>
                  </div>
                  <div class="reject-friend-button">
                  <button id="rejectFriend" class="button rejectFriendButton" 
                     onclick="rejectFriend('${friendRequest.m_id}')">거절</button>
                  </div>
               </div>
            </c:forEach>
            
         </c:otherwise>
         </c:choose>
         
          -->
         <hr>
         <script>
          function enter(){
              $('.user_find').keypress(function(e) { 
                 if (e.keyCode == 13){
                    user_find();
                    $('.u_find_btn').focus();
                  }
              });
           }
          function user_find(){
              var u_id = $('#m_id').val();
              var form = {
                    m_id : u_id
              }
              $.ajax({
                 url:"user_find",
                 type:"POST",
                 data: form,
                 dataType: "json",
                 cache    : false,
                 success: function(data){
                    console.log(data)
                    console.log(data.chk)
                    if(data.chk == 0){
                       alert("없는 아이디 입니다.")
                       
                    }else if (data.chk == 1){
                       $('#td_id').text(data.dto.m_id);
                       $('#td_name').text(data.dto.m_name);
                       $('#td_tel').text(data.dto.m_tel);
                    }
                 },
                 error:function(){
                    alert("문제가 발생 하였습니다.")
                 }
              });
           }
           function enter(){
              $('.user_find').keypress(function(e) { 
                 if (e.keyCode == 13){
                    user_find();
                    $('.u_find_btn').focus();
                  }
              });
           }
          function user_page(){
              var u_id = $('#td_id').text();
              location.href='u_page?u_id='+u_id;
           }
           
          </script>

         <hr>
         <div class="u_find">
            <h3>Search User</h3>
            <div class="u_find">
               <input type="text" class="user_find" onkeypress="enter()"
                  name="m_id" id="m_id" placeholder="Input User ID"
                  style="width: 200px; height: 40px;"> <input type="button"
                  class="u_find_btn" value="Find" onclick="user_find()">
            </div>
         </div>
         <hr>
         <div class="u_info">
            <h3>User Info</h3>
            <table border="1" class="u_info_table">
               <tr>
                  <td>아이디</td>
                  <th id="td_id"></th>
               </tr>
               <tr>
                  <td>이름</td>
                  <th id="td_name"></th>
               </tr>
               <tr>
                  <td>전화</td>
                  <th id="td_tel"></th>
               </tr>
               <tr>
                  <th colspan="2"><input type="button" value="GO"
                     onclick="user_page()"></th>
               </tr>
            </table>

         </div>

      </div>


   </div>


</div>

</body>
</html>