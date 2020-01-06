<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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
function acceptFriend(m_id){
   
   $.ajax({
      url: "u_page_friendAccept",
      type: "POST",
      data: {'m_id': m_id},
      success: function(data){
         $('#friendBox'+m_id).hide();
         alert("친구 요청 확인하셨습니다");
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
            alert("친구 요청을 거부 하셨습니다");
         },
         error: function(){
            alert("문제가 발생 하였습니다.");
         }
      });
   }
</script>

   <style type="text/css">
         body {
            overFlow : auto;
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
         }
         input::placeholder {
         text-align: center;
           color: #495164;
         }
         
         .pagewrap{
            width: 100%;
            height: 100%;
         }
         .bodywrap{
            margin-top:30px;
         }
         .left{
            float: left;
            width: 20%;
            height: 100%;
         }
         .center{
            float: left;
            width: 60%;
            height: 100%;
            margin-bottom: 30px;
         }
         .right{
            float: left;
            width: 20%;
            height: 100%;
         }
         
         .my_info{
            width:300px;
            height:400px;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         .my_info td{
            border-bottom:2px solid #495164;
            border-right:2px solid #495164;
            width:100px;
            height: 80px;
            word-break:break-all;
           font-size: 0.8em
         }
         .my_info th{
         border-bottom:2px solid #495164;
            font-size: 0.8em
         }
         .my_info img {
            width: 70px; height: 70px;
         }
         
         .u_info_table{
            width:300px;
            height:180px;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         
         
         .my_cat{
            background-color: lightgreen;
            margin-left: 20px;
            margin-top: 30px;
            margin-right: 20px;
            text-align: center;
         }
         .my_cat table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 20px;
         }
         
         .u_find{
            margin-left: 10px;
            margin-right: 10px;
            text-align: center;
         }
         .user_find{
         width: 250px;
         height: 80px;
         padding: 5px 5px;
         margin: 8px 0;
         box-sizing: border-box;
         border: 2px solid #6799FF;
         border-radius: 4px;
         }
         
         .u_find_btn{
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 200px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         
         .u_find h3{
            width:250px;
            height:45px;
             margin-left:auto;
             margin-right:auto;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
         }

         .u_info{
             margin-left: 10px;
            margin-right: 10px;
            text-align: center;
         }
         .u_info h3{
             width:250px;
            height:45px;
             margin-left:auto;
             margin-right:auto;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
              margin-bottom: 15px;
              margin-top: 15px;
         }
         .u_info_table{
            width:300px;
            height:180px;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         .u_info_table td{
            width:70px;
            word-break:break-all;
           font-size: 0.7em
         }
         .u_info_table th{
            font-size: 0.5em
         }
         .u_info_table input[type="button"] {
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 15px;   height:30px; width: 200px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .fix_table{
            width:450px;
            height:650px;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         .fix_table td{
            width:100px;
            word-break:break-all;
           font-size: 0.7em
         }
         .fix_table th{
            font-size: 0.8em
         }
         .fix_table input[type="submit"] {
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 15px;   height:40px; width: 400px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         
         .fix_table input[type="img"] {
            width: 100px; height: 100px;
         }
         .fix_table input[type="text"] {
            width: 300px; height: 50px;
         }
         
          
         
         
        
         .write_board_div{
            text-align: center;
         }
         .write_board_div h3{
            height:45px;
              margin-left:150px;
             margin-right:150px;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
              margin-bottom: 15px;
         }
         .write_board_table{
           border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
            width: 70%;
            height: 80%;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         .write_board_table tr{
         }
         .write_board_table td{
              border-bottom:2px solid #495164;
         }
         .write_board_table_btn{
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 600px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .file_btn{
            padding:1px; display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 100px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .file_chk_btn{
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 100px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .write_board_table input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
         
         .imgtd { display: none; text-align: center; border: 0px; }
         .imgtd img{
          display: block;
           margin: auto;
         }
         .reply_table{
         width: 100%;
         background-color: gray;
         height: 100px;
         font-size: 0.3em;
         border-top: 1px solid black;
         margin-bottom: 50px;
         }
         
         
         .my_info_btn_div{
            text-align: center;
         }
         .my_info_btn_div h3{
            width:250px;
            height:45px;
             margin-left:auto;
             margin-right:auto;
             margin-bottom:15px;
             margin-top:15px;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
         }
         .my_info_btn{
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 200px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .myinfo_frm{
            text-align: center;
         }
         
         .myinfo_frm h3{
            height:45px;
              margin-left:100px;
             margin-right:100px;
             color:#fff;
             text-align: center;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
              margin-bottom: 15px;
         }
         .myinfo_frm table{
            margin-left: auto;
            margin-right: auto;
         }
         
         
         
         
         .post-container {
            order: 1;
         }
         .post-container table {
            width: 70%;
            height: 16em;
            border-spacing: 0.2em;
            border-collapse: seperate;
         }
         .post-container table th {
         border:0px;
            padding: 0.5em;
            font-size: 16pt;
         }
         .post-container table td {
            padding: 0.5em;
            font-size: 12pt;
         }
         .post {
            margin-top: 5%;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         
         
         
         
         
      
         
         
         
         
         
         
   .modalDialog {
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
   
    .modalDialog:target {
   opacity:1;
   pointer-events: auto;
   }

   .modalDialog > div {
   width: 700px;
   position: relative;
   margin: 5% auto;
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
   
</style>
   <style type="text/css">
   #friendPage {
   background-color: white;
   width: 100%; 
}
      
    <!-- 게시글 스타일 -->
    
 #friendPage {
   order: 1;
}


#friendPage table {
   width: 70%;
   border-collapse: seperate;
}
#friendPage table th {
   padding: 0.5em;
   font-size: 16pt;
}
#friendPage table td {
   padding: 0.5em;
   font-size: 12pt;
}
#friendPage {
   margin-top: 5%;
}
   
   #profile {
    width: 40px; height: 40px;
    object-fit: cover;
    border-radius: 50%;
   }
   
   #friendPic {
      width: 40px; height: 40px;
    object-fit: cover;
    border-radius: 50%;
   }
 
   
   textarea[id^=r_content]{
    overflow-y:hidden;
    background:clear;
    font-size: 14px;
   }
   
   td,th {
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
   background: rgba(0,0,0,0.8);
   z-index: 99999;
   opacity:0;
   -webkit-transition: opacity 400ms ease-in;
   -moz-transition: opacity 400ms ease-in;
   transition: opacity 400ms ease-in;
   pointer-events: none;
   }
   
   .replyShow1:target {
   opacity:1;
   pointer-events: auto;
   }

   .replyShow1 > div {
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

   .close:hover { background: #00d9ff; }
   
   .overf {
      overflow:auto;
   }
  .ovr{

    display:block;
      width: 400px;
    height:350px;
    overflow-y:auto;

}


.postForm {
            margin-top: 3.5%;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:1px;
          border-spacing:0px;
          -moz-border-radius:1px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
            table-layout:fixed; 
            vertical-align: middle;
         }
         .postForm td {
            border-right:2px solid #495164;
           border-bottom:2px solid #495164;
         }
         .postForm th {
         border-right:2px solid #495164;
           border-bottom:2px solid #495164;
         }
         .re_td{
            text-align: center;
            margin-left: auto;
            margin-right: auto;
         }
         .p_btn_class{
            width: 150px;
            height: 35px;
         }
         .btn_td{
          margin-top: auto;
         margin-bottom: auto;
            text-align: center;
         }
         .replyBtn{
         padding-top:20px;
         display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 15px;   height:60px; width:500px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .center h3{
         text-align:center;
         margin-top: 20px;
          height:45px;
              margin-left:150px;
             margin-right:150px;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
              margin-bottom: 15px;
         }
   
   
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
   
   
   .repliesTable {
      width: 100%;
      overflow: auto;
   }
   
   .replyButtonsTable .table2{
      height: 20px;
   }
   #reply-list-container {
      
      display: block;
      overflow: auto;
      height: 200px;
      width: 100%;
      
   }
   #reply-list-container th, #reply-list-container td, #reply-list-container tr {
      text-align: center;
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
   }
   .appendedTd {
      text-align: center;
   }
   
   
    .u_find{
            margin-left: 10px;
            margin-right: 10px;
            text-align: center;
         }
         .user_find{
         width: 250px;
         height: 80px;
         padding: 5px 5px;
         margin: 8px 0;
         box-sizing: border-box;
         border: 2px solid #6799FF;
         border-radius: 4px;
         }
         
         .u_find_btn{
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 20px;   height:40px; width: 200px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         
         .u_find h3{
            width:250px;
            height:45px;
             margin-left:auto;
             margin-right:auto;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
         }

         .u_info{
             margin-left: 10px;
            margin-right: 10px;
            text-align: center;
         }
         .u_info h3{
             width:250px;
            height:45px;
             margin-left:auto;
             margin-right:auto;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
              margin-bottom: 15px;
              margin-top: 15px;
         }
         .u_info_table{
            width:300px;
            height:180px;
            border-collapse:separate;
          border:solid #495164 3px;
          border-radius:6px;
          -moz-border-radius:6px;
           border-spacing:0px;
           margin-left: auto;
            margin-right: auto;
         }
         .u_info_table td{
            width:70px;
            word-break:break-all;
           font-size: 0.7em
         }
         .u_info_table th{
            font-size: 0.5em
         }
         .u_info_table input[type="button"] {
            display: inline-block;  border-radius: 4px;  background-color: #6799FF;  border: none;  color: #FFFFFF;  text-align: center;  font-size: 15px;   height:30px; width: 200px;  transition: all 0.5s;  cursor: pointer;  margin: 5px;
         }
         .title_td{
         background-color: #D5D5D5;
         }
         .font{
          margin-top: auto;
          margin-botom: auto;
         }

   </style>

   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
   
   <script type="text/javascript">
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

             $(function(idgroup){
                  $('.p_btn_class[onload]').trigger('onload');
               });
      
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
            m_id :'${mid}',
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
   

 //========================================  
   $(document).ready(function(){
        $('.replyLineClass').hide();
      $('.closeReplies').hide();
      console.log('${postSuccess}');
      if ('${postSuccess}' != "") {
         console.log('${postSuccess}');
         if ('${postSuccess}' == '1') {
            alert("글 작성 완료");
         } else {
            alert("문제 발생");
         }
      }
 });
  
  
  function replyPostOpen(idgroup) {
      $('#replyLine'+idgroup).show();
   }
   
   function replyPost(idgroup){
      $.ajax({
         url: "reply_post_send",
         type: "POST",
         data: {
            'm_id': '${mid}',
            'r_idgroup': idgroup,
            'r_content': $('#replyBody'+idgroup).val()
            },
         success: function(data) {
            alert("Reply Success, data:" + data);
            getOneReply(idgroup);
         },
         error: function(){
            alert("Error")
         }   
      });
   }
   
   $(function(idgroup){
      $('.replyLineClass[onload]').trigger('onload');
   });
   $('body').on({
      DOMNodeInserted : function(){
         console.log('dynamic insert');
         $('.replyLineClass[onload]').trigger('onload');
         alert("dynamic");
      }
   });
   
   function createReplyArray(idgroup) {
      repliesArray.set(idgroup, replyCounter);
   }
   
   function getOneReply(idgroup) {
      var tempCounter = repliesArray.get(idgroup);
      $.ajax({
         url: "post_reply_show_one",
         type: "POST",
         data: {'r_idgroup': idgroup},
         success: function(data) {
            alert("success");
            $('.reply-list-container'+idgroup).prepend("<tr class='appendedTr'>" +
               "<td class='appendedTd'><button onload='r_like_btn("+value.m_id+","+value.r_idgroup+","+value.r_num+")' id='rbtn"+value.r_num+"' class='rr_btn_class'  onclick='r_like("+value.r_idgroup+","+value.r_num+")' >좋아<br>"+value.r_like+"</button></td>" +
               "<td>"+data.oneReply.m_id+"</td>" +
               "<td colspan='2'>"+data.oneReply.r_content+"</td>" +
               "</tr>");
            tempCounter +=1;
            repliesArray.set(idgroup, tempCounter);      
         },
         error: function(){
            alert("Error");
         }
      });
   }
   
   function showReplies(idgroup) {
      console.log('showreplies idgrou: ' + idgroup);
      var tempCounter = 0;
      var tempCounter = repliesArray.get(idgroup);
      console.log(idgroup)
      $('.closeReplies').show();
      $.ajax({
         url: "post_reply_show",
         type: "POST",
         data: {'r_idgroup': idgroup,
            'counter' : tempCounter
            },
         success: function(data) {
            console.log(data)
            alert("success");
            
            $.each(data.reply, function(index, value) {
            console.log(index + "" + value.r_idgroup);
               $('.reply-list-container'+value.r_idgroup).append("<tr class='appendedTr'>" +
                     "<td><button onload='r_like_btn("+value.m_id+","+value.r_idgroup+","+value.r_num+")' id='rbtn"+value.r_num+"' class='r_btn_class'  onclick='r_like("+value.r_idgroup+","+value.r_num+")' >좋아<br>"+value.r_like+"</button></td>" +
                     "<td>"+value.m_id+"</td>" +
                     "<td>"+value.r_num+"</td>" +
                     "<td colspan='2'>"+value.r_content+"</td>" +
                     "</tr>");
            });
            tempCounter +=4;
            repliesArray.set(idgroup, tempCounter);      
         },
         error: function() {
            alert("error");
         }
      });
   }
  
    function r_like(r_idgroup,r_num){
         var r_num = r_num
         var r_dto = {
               m_id : m_id,
               r_idgroup : r_idgroup,
               r_num : r_num
         }
         
         $.ajax({
            url:"r_like_up",
            type:"POST",
            data: r_dto,
            dataType: "json",
            success: function(data){
               if(data.chk==0){
                  alert("댓글 좋아요 올리기 성공.")
                  location.href='mypage';
               }else if(data.chk==1){
                  alert("댓글 좋아요 취소.")
                  location.href='mypage';
               }else if(data.chk==2){
                  alert("댓글 좋아요 초기 올리기 성공.")
                  location.href='mypage';
               }
            },
             error:function(){
                alert("문제가 발생 하였습니다.")
            }
         });
      }
    
       $(function(id,r_idgroup , r_num){
            $('.r_btn_class[onload]').trigger('onload');
         });
       
      var rbtn="#rbtn"
      function r_like_btn(id,r_idgroup,r_num){
      console.log('온로드')
      var form = {
            m_id : id,
            r_idgroup :r_idgroup,
            r_num : r_num
      }
      $.ajax({
         url: "r_like_btn",
         type: "POST",
         data: form,
         success: function(data) {
            if(data.chk==1){
            console.log(data.r_num)
            $( rbtn+data.rr_num ).css({
               color: "red"
            });
      }
      },
      error: function() {
      
         }
      });
      }
   
   function closeReplies(idgroup) {
      $('.appendedTr').remove();
      var tempCounter = 2;
      repliesArray.set(idgroup, tempCounter);   
      $('.closeReplies').hide();
   }
   </script>
   
<script type="text/javascript">
   var m_id = '${mid}';
   var flag = true;
   var replyCounter = 2;
   var repliesArray = new Map();
   var testmap = new Map();
 
 
    //윈도우 열림
   window.onload = function(){
      setTimeout (function(){
      scrollTo(0,0);
      },100);
   }   
   
 
    
    
    
   function my_info(){
       location.href='#openModal';
        $.ajax({
           url:"my_info",
            type:"POST",
            dataType: "json",
            cache    : false,
            success: function(data){
               $('#my_id').val(data.memdto.m_id);
               $('#my_pw').val(data.memdto.m_pw);
               $('#my_name').val(data.memdto.m_name);
               $('#my_idnum').val(data.memdto.m_idnum);
               $('#my_pic').attr('src', 'img/'+data.memdto.m_pic);
               
               var gender=null;
               if(data.memdto.m_gender==1){
                  gender="남자";
               }else{
                  gender="여자";
               }
               $('#my_gender').val(gender);
               $('#my_tel').val(data.memdto.m_tel);
               $('#my_mail').val(data.memdto.m_mail);
            },
            error:function(){
               alert("문제가 발생 하였습니다.")
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
      

      
      
      var cnt=0;
      function reply_test(p_idgroup) {
            num = p_idgroup;
            console.log(num)

            var form = {
                  p_idgroup : p_idgroup
            }
            var lists = new Array();
            console.log(cnt)
            if((cnt%2)==0){
               $.ajax({
                  url:"replylist",
                  type:"POST",
                  data: form,
                  cache    : false,
                  dataType: "json",
                  success: function(data){
                     console.log(data)
                     lists=data.replylist_1;
                     for(var i=0; i<lists.length; i++){
                        $(".reply_add"+num).append(
                           "<table border='1' class='reply_table"+num+"'>"+
                           "<tr><td>"+lists[i].m_id+"</td></tr>"+
                           "<tr><td>"+lists[i].r_idgroup+"</td></tr>"+
                           "<tr><td>"+lists[i].r_content+"</td></tr>"+
                           "<tr><td>"+lists[i].r_date+"</td><td>"+lists[i].r_like+"</td></tr>"+
                           "</table>"
                         );
                     }
                        $(".reply_add"+num).append(
                           "<table class='reply_table_w"+num+"'>"+
                           "<tr><td>글작성</td></tr>"+
                           "<tr><td><input class='w_re"+num+"' type='text' placeholder='댓글작성'></td></tr>"+
                           "<tr><td><input type='button' onclick='reply_write("+num+")' value='add' ></td></tr>"+
                           "</table>"
                         );
                  },
               error:function(){
                  alert("문제가 발생 하였습니다.")
               }
               });
               cnt++;
            }else if((cnt%2)!=0){
               $(".reply_table"+num).remove();
               $(".reply_table_w"+num).remove();
               cnt++;
            }
      }
      
      function reply_write(num) {
         var id = '${mid}';
         var idgroup = num;
         var content = $(".w_re"+num).val();
         var like = 0;
         console.log(content)
         
         if(content==""){
            alert('댓글 내용을 입력하세요')
         }else{
         
            var r_dto = {
                  m_id : id,
                  r_idgroup : idgroup,
                  r_content : content,
                  r_like : like
            }
            
            $.ajax({
               url:"reply_write",
               type:"POST",
               data: r_dto,
               success: function(data){
                  alert("댓글 등록 완료.")   
                  reply_test(num);
                  reply_test(num);
               },
                error:function(){
                   alert("문제가 발생 하였습니다.")
               }
            });
         }
      }
   
   
      
      $(window).scroll(function(){
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
           flag = true;
          // $('.loader').show();
           $.ajax({
              url: "boardlist",
              type: "POST",
              data: {'u_id':m_id},
              dataType: "JSON",
              cache: false,
              success: function(data) {

                 if (flag && data.morePosts) {
                    var id = data.post.m_id;
                     var title = data.post.p_title;
                     var cat = data.post.p_cat;
                     var hash = data.post.p_hash;
                     var content = data.post.p_content;
                     var img = data.post.p_img;
                     var date = data.post.p_date;
                     var pnum = data.post.p_num;
                     var rcount = data.post.p_rCount;
                     var idgroup = data.post.p_idgroup;
                     var plike = data.post.p_like;
                     var rCount = data.post.p_rCount;
                    
                    flag = false;
                  //  $('.loader').hide();
                       if (data != null) {
                          console.log(data.post.m_id)
                            console.log(data.post.p_idgroup)
                            console.log(data.post.p_num)
                          $("#friendPage").append(
                                  "<table class='postForm'><tr>"+
                                    "<tr >"+
                                       "<th colspan='1' class='title_td'>제목</th>"+
                                       "<td colspan='3' align='center'>"+title+"</td>"+
                                      "</tr>"+
                                    "<tbody class='post-image"+pnum+"'></tbody>"+
                                    "<tr >"+
                                    "<th colspan='1' class='title_td'>카테고리</th>"+
                                    "<td colspan='1' align='center'>"+cat+"</td>"+
                                       "<th colspan='1' class='title_td'>해시</th>"+
                                       "<td colspan='1'>"+hash+"</td>"+
                                    "<tr >"+
                                      "<td colspan='2' class='btn_td'>"+
                                      "<button onload='p_like_btn("+idgroup+")' id='btn"+idgroup+"' class='p_btn_class' onclick='p_like("+idgroup+")' >좋아요 : <label id='lcount"+idgroup+"'>"+plike+"</label></button>"+
                                      "</td>"+
                                      "<th colspan='1' class='title_td'>작성자</th>"+
                                      "<td colspan='1' align='center'>"+id+"</td>"+
                                    "</tr>"+
                                    "<tr >"+
                                       "<td colspan='4' class='re_td' align='center'>"+
                                       "<div class='replyBtn' OnClick=location.href='#replyShow"+idgroup+"' id='"+idgroup+"' value='"+id+"'>댓글 "+rCount+"개 모두 보기</div></td>"+     
                                    "</tr>"+"</table>"+
                                    "<div id='replyShow"+idgroup+"' class='replyShow1' height='500px'>"+
                                    "<div class='replyTag"+idgroup+"'>"+
                                    "<a href='#Close' title='Close' class='close' onclick='replyClose("+idgroup+")';>X</a>"+
                                    "<table id='replyTable' width='300px' height='500px'>"+
                                    "<tbody id='replyList"+idgroup+"' class='ovr' ></tbody></table>"+
                                    "<div id='inputReply$"+idgroup+"' style='height: 100px'>"+
                                    "<table border='1' id='replyInput'>"+
                                       "<tr>"+
                                       "<td ><img  src='img/${proImg}' id='profile'></td>"+
                                       "<td><b>${mid}</b><br>"+
                                       "<form id='replyForm"+idgroup+"' method='post' class='r_form'>"+
                                          "<textarea id='r_content"+idgroup+"' name='r_content' placeholder='댓글 달기...' style='width: 200px; height: 30px'></textarea>"+
                                          "<input type='hidden' name='r_idgroup' value='"+pnum+"'>"+
                                          "<input type='hidden' name='r_pic' value='${proImg}'>"+
                                          "<input class='addBtn' id='"+idgroup+"' type='button' value='게시' style='height: 50px; width: 80px;'>"+
                                       "</form>"+
                                          "</td>"+
                                          "</tr>"+
                                    "</table>"+
                                    "</div>"+
                                 "</div><br>");
                                    
                                  if (img != 'null') {
                                      $(".post-image"+pnum).append(
                                         "<tr>"+
                                         "<td colspan='2' style=' border-right:0px;' align='center'><img src='img/"+img+"' width='150px' height='150px'></td>"+
                                           "<td colspan='2' align='center' style='width: 650px; height: 200px;'>"+content+"</td>"+
                                           "</tr>");
                                   } else {
                                      $(".post-image"+pnum).append(
                                          "<tr>"+
                                          "<td colspan='4' align='center' style='width: 650px; height: 200px;'>"+content+"</td>"+
                                            "</tr>");
                                   }
                                     $(document).ready(function() {
                                         $("[class^=replyTag]").hide();
                                     }); 
                    } else {
                       alert("더이상 글이 없습니다");
                     //  $('.loader').show();
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
      
      function del_post(p_num){
         var num = p_num;
         var form = {
            p_num : num
         }
         $.ajax({
             url: "del_post",
              type: "POST",
              data: form,
              success: function() {
                 alert('글삭제 성공');
                 location.href="mypage"
              },
              error: function() {
                 
              }
           });
      }
      

   </script>
   
   <script type="text/javascript">
    
        $(function() {
            $("#postImage").on('change', function(){
                
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
 
            reader.onload = function (e) {
                    $('#previewPic').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
        
        function postsubmit(){
            var p_cat = $("#p_cat option:selected").val();
             var p_hash = $('#p_hash').val();
             var p_title = $('#p_title').val();
             var p_content =  $('#p_content').val();
             var p_scope = $('#p_scope').val();
             if(p_title=="" || p_title==null){
                alert('제목을 입력하세요')
             }else{
                if(p_cat=="" || p_cat==null){
                    alert('카테고리를 입력하세요')
                 }else{
                    if(p_scope=="" || p_scope==null){
                        alert('공개범위를 입력하세요')
                     }else{
                        $("#frm").submit();
                     }
                 }
             }
        }
        function img_chk(){
           var $img = $("#previewPic");
           var src = $img.attr("src");
           if(src != '/controller/resources/images/placeholder.jpg'){
              $('#imgtd_id').css({
                  display: "block"
               });
           }else if(src == '/controller/resources/images/placeholder.jpg'){
              alert('선택한 사진이 없습니다.')
               $('#imgtd_id').css({
                    display: "none"
                 });
             }
        }
        function img_choose() {
           $('#postImage').click();
      }
    </script>
   
</head>
<body>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">
      <div class="left">
         <hr>
         <div class="my_info_btn_div">
         <h3>My Info</h3>
         <c:set var="info" value="${myinfo }"/>
            <table class="my_info">
            <tr>
               <td>사진</td><th>  <img class="myinfo_frm_img" alt="error" id="my_pic" src="img/${info.m_pic }" ></th>
            </tr>
            <tr>
               <td>이름</td><th>  ${info.m_name }</th>
            </tr>
            <tr>
               <td>전화</td><th>${info.m_tel }</th>
            </tr>
            <tr>
               <td>메일</td><th>${info.m_mail }</th>
            </tr>
            </table>
            <button class="my_info_btn" onclick="my_info()">My Info & Fix</button>
           </div>
           <c:choose>
         <c:when test="${noFriendRequests == true }">
            <div class="no-friend-request-container">
               현재 친구 요청이 <br>없습니다
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
           <div>
           <hr>
           <div id="openModal" class="modalDialog">
              <div>
            <a href="#close" title="Close" class="close">X</a>
                  <div class="myinfo_frm" >
                     <h3>My Info</h3>
                     <form action="fix_myinfo" method="post">
                     <table border="1" class="fix_table">
                      <tr>
                        <td>비밀번호</td><th> <input type="text" id="my_pw" name="my_pw" > <input type="hidden" id="my_id" name="my_id" ></th>
                        </tr>
                     <tr>
                        <td>이름</td><th>  <input type="text" id="my_name" name="my_name" ></th>
                        </tr>
                     <tr>
                        <td>전화</td><th>   <input type="text" id="my_tel" name="my_tel" ></th>
                        </tr>
                     <tr>
                        <td>메일</td><th>  <input type="text" id="my_mail" name="my_mail" ></th>
                        </tr>
                     <tr>
                        <th colspan="2" ><input type="submit" value="Fix" ></th>
                       </tr>
                     </table>
                     </form>
                  </div>
              </div>
           </div>
           
        </div>
      </div>
      
      
      <div class="center">
            <div class="write_board_div" >
            <h3>NEW POST</h3>
            <form action="write_board" name="postForm" id="frm" method="post" enctype="multipart/form-data">
               <table class="write_board_table">   
               <tr>
                  <td colspan="1" style="font-size: 0.5em; border-right: 1px solid black;">제목</td><td colspan="5"><input type="text" id="p_title" name="p_title" style="width: 500px; height: 35px;" ></td>
               </tr>
               <tr>
                  <td colspan="6"><input type="text" id="p_content" name="p_content" placeholder="Contents" style="width: 790px; height: 200px;" autocomplete=”off”></td>
               </tr>
               <tr>
                  <td colspan="3"><input class="file_btn" type="button" onclick="img_choose()" value="사진 선택"><input type="file" id="postImage" name="postImage" ></td>
                  <td colspan="3" ><input class="file_chk_btn" type="button"onclick='img_chk()' value="사진확인"></td>
                  </tr>
               <tr style="text-align: center;">
                  <td colspan="6" class="imgtd" id="imgtd_id" ><img id="previewPic" src="${placeholder}" width="200px" height="100px" ></td>
               </tr>
               <tr>
                  <td colspan="2" style="width: 160px; height: 50px;">
                     <select id="p_cat" name="p_cat">
                       <option value="" selected data-default>카테고리선택</option>
                       <option value="news">뉴스</option>      <option value="sports">스포츠</option>   <option value="food">음식</option>   <option value="language">언어</option>   <option value="people">인물</option>
                        <option value="animal">동물</option>      <option value="fashion">패션</option>      <option value="love">연애</option>   <option value="movie">영화</option>      <option value="religion">종교</option>
                        <option value="knowledge">지식</option>   <option value="travel">여행</option>      <option value="cartoon">만화</option>   <option value="game">게임</option>      <option value="it">IT</option>
                        <option value="weather">날씨</option>      <option value="music">음악</option>      <option value="car">자동차</option>   <option value="economy">경제</option>      <option value="etc">기타</option>
                         <option value="job">직업</option>         <option value="living">리빙</option>      <option value="book">도서</option>   <option value="festival">축제</option>   <option value="health">건강</option>
                     </select>
                  </td>
                  <td colspan="1" style="width: 160px; height: 50px; border-left: 1px solid black; border-right: 1px solid black; ">
                     <select id="p_scope" name="p_scope">
                     <option value="" selected data-default>공개범위</option>
                     <option value="0">나만보기</option><option value="1">친구공개</option><option value="2">전체공개</option></select>
                  </td>
                  <td colspan="2" style="font-size: 0.5em;"><input type="text" id="p_hash" name="p_hash" placeholder="해시태그 입력" style="width:350px; height: 40px;"></td>
               </tr>
               <tr>
                  <td colspan="6" style="border-bottom: 1px solid;"><input class="write_board_table_btn" type="button" id="sub" onclick="postsubmit()" value="작성완료"></td>
               </tr>
            </table>
            </form>
            
            </div>
         <hr>
         
       <div id="friendPage" align="center">
         <c:forEach var="m_list" items="${boardlist }" varStatus="status" end="2">
         <table class="postForm" >
            <tr >
               <th colspan="1" class="title_td" >제목</th>
               <td colspan="3" style="table-layout:fixed; width: 75%;" align="center">${m_list.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
            <c:choose>
            <c:when test="${m_list.p_img != 'null'}">
            <tr >
               <td colspan="2" style=" border-right:0px;" align="center"><img src="img/${m_list.p_img }" width="150px" height="150px"></td>
               <td colspan="2" align="center" style="width: 650px; height: 200px;">${m_list.p_content }</td>
            </tr>
            </c:when>
            <c:otherwise>
            <tr >
               <td colspan="4" align="center" style="width: 650px; height: 200px;">${m_list.p_content }</td>
            </tr>
            </c:otherwise>
            </c:choose>
            <!-- =========================================== -->
            <tr >
               <th colspan="1" style="width: 50px;" class="title_td">카테고리</th>
               <td colspan="1"  align="center">${m_list.p_cat }</td>
               <th colspan="1" class="title_td" >해시</th>
               <td colspan="1" style="text-align: center">${m_list.p_hash }</td>
            </tr>
            <tr >
               <td colspan="2" class="btn_td" style="table-layout:fixed; width: 25%;">
             <button onload="p_like_btn(${m_list.p_idgroup })" id="btn${m_list.p_idgroup }" class="p_btn_class"  onclick="p_like(${m_list.p_idgroup })" >좋아요  <label id="lcount${m_list.p_idgroup }">${m_list.p_like }</label></button>
               </td>
               <th colspan="1" class="title_td" >작성자</th>
               <td colspan="1" align="center">${m_list.m_id } 
            </tr>
            <tr >
               <td colspan="4" align="center" class="re_td">
                <div class="replyBtn" OnClick="location.href='#replyShow${m_list.p_idgroup} '" id="${m_list.p_idgroup}" value="${mid}">댓글 ${m_list.p_rCount }개 모두 보기</div></td>
               </tr>
            </table>
            
               <div id="replyShow${m_list.p_idgroup}" class="replyShow1" height="500px">
               <div class="replyTag${m_list.p_idgroup}">
               <a href="#Close" title="Close" class="close" onclick="replyClose(${m_list.p_idgroup});">X</a>
               <table  id="replyTable" width="300px" height="500px">
               <tbody  id="replyList${m_list.p_idgroup}" class="ovr" ></tbody>
               </table>
               
               <div id="inputReply${m_list.p_idgroup}" style="height: 100px">
               <table border="1" id="replyInput" >
                  <tr>
                     <td><img src="img/${proImg}" id="profile"></td>
                     <td><b>${mid}</b><br>
                  <form id="replyForm${m_list.p_idgroup}"  method="post" class="r_form">
                     <textarea id="r_content${m_list.p_idgroup}" name="r_content" placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
                     <input type="hidden" name="r_idgroup" value="${m_list.p_num}">
                     <input type="hidden" name="r_pic" value="${proImg }">
                     <input class="addBtn" id="${m_list.p_idgroup}" type="button" value="게시" style="height: 50px; width: 80px;">
                  </form>
                     </td>
                     </tr>
               </table>
               </div>
            </div><br>
            </div>
           </c:forEach>
        </div>

      </div>
      <div class="right">
      <hr>
         <div class="u_find">
            <h3>Search User</h3>
            <div class="u_find">
                <input type="text" class="user_find" onkeypress="enter()" name="m_id" id="m_id" placeholder="Input User ID" style="width: 200px; height: 40px;">
                <br>
                <input type="button" class="u_find_btn" value="Find" onclick="user_find()">
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
                 <th colspan="2"><input type="button" value="GO" onclick="user_page()"></th>
              </tr>
           </table>
           
         </div>
      </div>
   </div>
</div>

</body>
</html>