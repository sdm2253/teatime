<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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

<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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

//==============================================
//무한 스크롤 함수
$(function(){
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            scrollT = scrollTop;
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
           // console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );

            if( scrollTop + windowHeight == documentHeight ){
                postList();
            }
        })
})


 //친구 게시글 ajax 함수
let postList = function(){
    $.ajax({
       url:"fpostList",
       type:"POST",
       //dataType: "json",
       cache    : false,
       data:  {page_no : page_no},
       success: function(data){
       console.log(data)
       var mid = $('.replyBtn').attr("value");
       
            if(data.length > 0){
                   for(i=0; i<data.length; i++){
                   var id = data[i].m_id;
                   var title = data[i].p_title;
                   var cat = data[i].p_cat;
                   var hash = data[i].p_hash;
                   var content = data[i].p_content;
                   var img = data[i].p_img;
                   var date = data[i].p_date;
                   var pnum = data[i].p_num;
                   var rcount = data[i].p_rCount;
                   var idgroup = data[i].p_idgroup;
                   var plike = data[i].p_like;
                   var rCount = data[i].p_rCount;
                   console.log(pnum);
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
                   
                   }
            }else {
               alert("마지막 게시글 입니다.");
            }
      
            page_no += 3; },//스크롤 닿을시 게시글 3개씩 불러오기
       error:function(){
          alert("에러.")
       }
    });
 }
   
</script>

<title>Insert title here</title>
   <style type="text/css">
      html, body {
      height: 100%;
      }
      
      .pagewrap{
      
         width: 100%;
         height: 100%;
      }
      .bodywrap{
         height: 100%;
       
      }
      
      .left{
         float: left;
         width: 20%;
         height: 100%;
         
      }
      #le {
         width: 70%;
         height: 100%;
         margin : 10px 0 0 50px;
      
      }
      #f_img {
         padding : 0 0 0 20px;
      }
      
      ul,li {margin:0; padding:0; font-size: 20px; list-style: none; }
      ol {
         margin: 0 0 0 10px;
         font-size: 15px;
      }
   
      .center{
         float: left;
         width: 60%;
       text-align:center;
      }
      
      .right{
         float: left;
         width: 20%;
         height: 100%;
         
      }
      
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
   </style>
</head>
<body>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/f_header.jsp"/>
   <div class="bodywrap">   
      <div class="left">
         <div id="le">
            <img id="f_img" src="https://img.icons8.com/officel/50/000000/user-group-man-woman.png">
            <b style="font-size: 30px; position: absolute; left: 130px; top: 100px;">내 친구</b>
               <ul>
                  <c:forEach items="${flist}" var="list">
                     <li><a style="color: black; border-bottom: 2px solid black;font-size: 25px; display:block; 
                       text-decoration:none;" href="u_page?u_id=${list.m_id}">
                       <img src="img/${list.m_pic}" id="friendPic"> <b style="padding : 0 0 30 0">${list.m_id }</b></a></li>
                 </c:forEach>  
               </ul>   
         </div>
      </div>
      
      <!-- ############################################ -->
      <div class="center">
        <div id="friendPage" align="center">
         <h3>POST</h3>
         <c:forEach var="fPosts" items="${fPost}" varStatus="status" end="3">
         <table class="postForm" >
            <tr >
               <th colspan="1" class="title_td" >제목</th>
               <td colspan="3" style="table-layout:fixed; width: 75%;" align="center">${fPosts.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
            <c:choose>
            <c:when test="${fPosts.p_img != 'null'}">
            <tr >
               <td colspan="2" style=" border-right:0px;" align="center"><img src="img/${fPosts.p_img }" width="150px" height="150px"></td>
               <td colspan="2" align="center" style="width: 650px; height: 200px;">${fPosts.p_content }</td>
            </tr>
            </c:when>
            <c:otherwise>
            <tr >
               <td colspan="4" align="center" style="width: 650px; height: 200px;">${fPosts.p_content }</td>
            </tr>
            </c:otherwise>
            </c:choose>
            <!-- =========================================== -->
            <tr >
               <th colspan="1" style="width: 50px;" class="title_td">카테고리</th>
               <td colspan="1"  align="center">${fPosts.p_cat }</td>
               <th colspan="1" class="title_td" >해시</th>
               <td colspan="1" style="text-align: center">${fPosts.p_hash }</td>
            </tr>
            <tr >
               <td colspan="2" class="btn_td" style="table-layout:fixed; width: 25%;">
              <button onload="p_like_btn(${fPosts.p_idgroup })" id="btn${fPosts.p_idgroup }" class="p_btn_class"  onclick="p_like(${fPosts.p_idgroup })" >좋아요  <label id="lcount${fPosts.p_idgroup }">${fPosts.p_like }</label></button>
               </td>
               <th colspan="1" class="title_td" >작성자</th>
               <td colspan="1" align="center">${fPosts.m_id } 
            </tr>
            <tr >
               <td colspan="4" align="center" class="re_td">
                <div class="replyBtn" OnClick="location.href='#replyShow${fPosts.p_idgroup} '" id="${fPosts.p_idgroup}" value="${mid}">댓글 ${fPosts.p_rCount }개 모두 보기</div></td>
               </tr>
            </table>
            
               <div id="replyShow${fPosts.p_idgroup}" class="replyShow1" height="500px">
               <div class="replyTag${fPosts.p_idgroup}">
               <a href="#Close" title="Close" class="close" onclick="replyClose(${fPosts.p_idgroup});">X</a>
               <table  id="replyTable" width="300px" height="500px">
               <tbody  id="replyList${fPosts.p_idgroup}" class="ovr" ></tbody>
               </table>
               
               <div id="inputReply${fPosts.p_idgroup}" style="height: 100px">
               <table border="1" id="replyInput" >
                  <tr>
                     <td><img src="img/${proImg}" id="profile"></td>
                     <td><b>${mid}</b><br>
                  <form id="replyForm${fPosts.p_idgroup}"  method="post" class="r_form">
                     <textarea id="r_content${fPosts.p_idgroup}" name="r_content" placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
                     <input type="hidden" name="r_idgroup" value="${fPosts.p_num}">
                     <input type="hidden" name="r_pic" value="${proImg }">
                     <input class="addBtn" id="${fPosts.p_idgroup}" type="button" value="게시" style="height: 50px; width: 80px;">
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