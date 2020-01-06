<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.replyList {
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

.replyList:target {
   opacity: 1;
   pointer-events: auto;
}

.replyList>div.test {
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


.close:hover {
   background: #00d9ff;
}

.repliesTable {
   width: 100%;
   overflow-y: auto;
}

.replyButtonsTable .table2 {
   height: 20px;
}

#reply-list-container {
   display: block;
   overflow-y: auto;
   height: 200px;
   width: 100%;
}

#reply-list-container th, #reply-list-container td,
   #reply-list-container tr {
   text-align: center;
   word-break: break-all;
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
   word-break: break-all;
   width: 400px;
}

.appendedTd {
   text-align: center;
   word-break: break-all;
   width: 400px;
}

textarea {
   resize: none;
}

#main {
   background-color: white;
   width: 80%;
   height: 100%;
   margin: 0 0 0 10%;
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

#profile {
   border-radius: 50%;
   -moz-border-radius: 50%;
   -khtml-border-radius: 50%;
   -webkit-border-radius: 50%;
   whdth: 60px;
   height: 60px;
}

#ta, #hash {
   border: 0;
   overflow-y: hidden;
   background: clear;
   width: 640px;
   font-size: 14px;
}

#tit {
   border: 0;
   overflow-y: hidden;
   background: clear;
   font-size: 14px;
}

.bodyall {
   display: flex;
   flex-flow: row;
   background-color: white;
   height: 100%;
}

.right {
   order: 3;
   float: right;
   width: 18%;
   height: 100%;
}

.left {
   order: 1;
   float: left;
   width: 18%;
   height: 100%;
}

.mainlist {
   order: 2;
   float: center;
   width: 60%;
   height: 100%;
}

#count {
   display: none;
}

.modalDialog {
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

.modalDialog:target {
   opacity: 1;
   pointer-events: auto;
}

.modalDialog>div {
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

.close:hover {
   background: #00d9ff;
}

.category-btn {
   box-shadow: 0px 2px 3px 2px #9fb4f2;
   background-color: #5cd0e5;
   border-radius: 10px;
   display: inline-block;
   cursor: pointer;
   color: #ffffff;
   font-family: Arial;
   font-size: 22px;
   padding: 14px 76px;
   text-decoration: none;
   text-shadow: 0px 0px 9px #283966;
}

.myButton:hover {
   background-color: #5cd0e5;
}

.myButton:active {
   position: relative;
   top: 1px;
}

#catefont {
   color: #cc9900;
}

#nocatefont {
   color: #5cd0e5;
}

#listtable{
   background-color: lightyellow;
}

#friendPage {
   background-color: white;
   width: 100%; 
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
    border:0;
    overflow-y:hidden;
    background:clear;
    font-size: 14px;
   }
   
   td,th {
   font-size: 15px;
   
   }
   
   div[class^=replyBtn]{
      cursor:pointer; 
      color: white;
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

.title_td{
   background-color: #D5D5D5;
         }
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>

var snum = 5;
var page_no = 0;
var re_no = 0;


   //====== John 수정 12/2 =====
   var sessionId = '${mid}';
   var flag = true;
   var replyCounter = 2;
   var repliesArray = new Map();
   //=========================
    
      
      
   $(document).ready(function(){
      //====== John 수정 12/2 =====
      $('.replyLineClass').hide();
      $('.closeReplies').hide();
      //=========================
      $('#catlist').hide();
      $('#close').hide();
      $('#catbutton1').click(function(){
         var form = {m_id : '${mid}'}
         $.ajax({
            type:"POST",
            url:"categorycall",
            data: form,
            dataType: "json",
            success: function(data){
                $("#catform").append("<div id='listdiv'><table id='listtable'></table></div>"); 
               $.each(data.Y, function (i, item) {   // item은 N Y 임 즉 스포츠부터 차례대로임.
// each(data,function(i,item)) i 만큼 돌고  item 은 data 가 하나하나 들어감 , list 가 data 라고 치면 행 하나하나가 들어감 ex) dto d = list.get(i) 이렇게 하나의 줄이 다 들어감
              //  alert("i : "+i);
                        //  alert("item : "+item.version);
                         // alert("item : "+item.codename);
                         $("#listtable").append("<tr><td><font id='catefont'><h2>"+item +"</h2></font></td><td><input type='checkbox' class='check_cate' name='c_"+item+"' checked='checked'></td></tr>");  
                      });
                   $.each(data.N, function (i, item) {
                      $("#listtable").append("<tr><td><font id='nocatefont'><h2>"+item +"</h2></font></td><td><input type='checkbox' class='check_cate' name='c_"+item+"'></td></tr>");
                    });
                 $('#listtable').append("<tr><td colspan='2'><input type='submit' class='category-btn' value='등록'></td></tr>"); 
                $('#close').show();
               $("#catbutton1").hide();
               $("#catlist").show();
            }
         });   
      });
   });
   
   
   /////////////////////////////////////////////////////////////////
     function catupdate() {
         $("#catlist").hide();
          $(".check_cate").each(function () {
              if ($(this).is(":checked")) {
                 var cat_name = $(this).attr("name");
                  $("#catform").append("<input type='hidden' name='"+cat_name+"' value='Y'>");
              }else{
                    var cat_name = $(this).attr("name");
                     $("#catform").append("<input type='hidden' name='"+cat_name+"' value='N'>");
              }
               $("#listdiv").remove(); // 여기까지 다 실행되고 서브밋 되기때문에 위에서 임의로 catform에 값을 넣어줘야 함.
             });
      }

                
   
   
   
   function cateclose() {
      $("#catlist").hide();
      $("#catbutton1").show();
      $("#close").hide();
      $("#listdiv").remove();
   }
   
   //====== John 수정 12/2 =====
   function replyPostOpen(idgroup) {
      $('#replyLine'+idgroup).show();
   }
   function replyPost(idgroup){
      $.ajax({
         url: "reply_post_send",
         type: "POST",
         data: {
            'm_id': sessionId,
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
               "<td class='appendedTd'>like</td>" +
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
      $('.closeReplies').show();
      $.ajax({
         url: "post_reply_show",
         type: "POST",
         data: {'r_idgroup': idgroup,
            'counter' : tempCounter
            },
         success: function(data) {
            alert("success");
            
            $.each(data.reply, function(index, value) {
            console.log(index + "" + value.r_idgroup);
               $('.reply-list-container'+value.r_idgroup).append("<tr class='appendedTr'>" +
                     "<td>like</td>" +
                     "<td>"+value.m_id+"</td>" +
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
   $('body').on({
      DOMNodeInserted : function(){
         console.log('dynamic insert');
         $('.replyLineClass[onload]').trigger('onload');
         alert("dynamic");
      }
   });
   
   function closeReplies(idgroup) {
      $('.appendedTr').remove();
      var tempCounter = 2;
      repliesArray.set(idgroup, tempCounter);   
      $('.closeReplies').hide();
   }
   
   //=========================
   
      $(window).scroll(function() {
          if ($(window).scrollTop() == $(document).height() - $(window).height()) {
             var realcount = {countform : $('#realcount').val()}
             var hashcount = {hashcount : $('#hashcount').val(), 'm_search' : '${m_search}'}
             var hash = $('#hashcount').val();
             console.log(realcount);
             
             if ('${param.m_search}' != "") {
                console.log(hashcount);
                if(hash>=3){
                $.ajax({
                  url:"hashajax",
                  type:"POST",
                  data:hashcount,
                  dataType: "json",
                  cache    : false,
                  success: function(data){
                	  var mid = $('.replyBtn').attr("value");

                     if(data.chk=='true'){ 
                        var cnt = data.cnt;
                          for (var i = 0; i < cnt; i++) {
                              var id = data.list2[i].m_id;
                              var title = data.list2[i].p_title;
                              var cat = data.list2[i].p_cat;
                              var hash = data.list2[i].p_hash;
                              var content = data.list2[i].p_content;
                              var img = data.list2[i].p_img;
                              var date = data.list2[i].p_date;
                              var pnum = data.list2[i].p_num;
                              var rcount = data.list2[i].p_rCount;
                              var idgroup = data.list2[i].p_idgroup;
                              var plike = data.list2[i].p_like;
                              var rCount = data.list2[i].p_rCount;
                        	  $("#friendPage").append(
                                      
                                      "<table class='postForm'><tr>"+
                                        "<tr >"+
                                           "<th colspan='1' class='title_td'>제목</th>"+
                                           "<td colspan='3' align='center'>"+title+"</td>"+
                                          "</tr>"+
                                        
                                        //  "<tr >"+
                                          //"<td style=' border-right:0px;' colspan='2' align='center'>"+img+"</td>"+
                                          // "<td colspan='2' align='center'>"+content+"</td>"+
                                      //  "</tr>"+
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
                                      $('.p_btn_class[onload]').trigger('onload');
                                      
                                      }
                          var count = data.count; // 3+3=6
                          console.log(count);
                          $(".divcount").remove();
                          $(".mainlist").append("<div class='divcount'><input type='hidden' id='hashcount' value='"+count+"'></div>")
                     }else if(data.chk=='false'){
                     					   if (confirm('마지막 글입니다. 처음으로 가시겠습니까?')) {
                          				 $('html').scrollTop(0);
                       				 }
                    				}
                  },
                  error:function(){
                     if (confirm('마지막 글입니다. 처음으로 가시겠습니까?')) {
                        $('html').scrollTop(0);
                     }
                  }
                  
               });
                }
            }else if('${param.m_search}' == ""){
                 $.ajax({
                  url:"mainajax",
                  type:"POST",
                  data:realcount,
                  dataType: "json",
                  cache    : false,
                  success: function(data){
                	  var mid = $('.replyBtn').attr("value");

                      if(data.chk=='true'){ 
                         var cnt = data.cnt;
                           for (var i = 0; i < cnt; i++) {
                               var id = data.list2[i].m_id;
                               var title = data.list2[i].p_title;
                               var cat = data.list2[i].p_cat;
                               var hash = data.list2[i].p_hash;
                               var content = data.list2[i].p_content;
                               var img = data.list2[i].p_img;
                               var date = data.list2[i].p_date;
                               var pnum = data.list2[i].p_num;
                               var rcount = data.list2[i].p_rCount;
                               var idgroup = data.list2[i].p_idgroup;
                               var plike = data.list2[i].p_like;
                               var rCount = data.list2[i].p_rCount;
                               console.log(rCount);
                         	  $("#friendPage").append(
                                       
                                       "<table class='postForm'><tr>"+
                                         "<tr >"+
                                            "<th colspan='1' class='title_td'>제목</th>"+
                                            "<td colspan='3' align='center'>"+title+"</td>"+
                                           "</tr>"+
                                         
                                         //  "<tr >"+
                                           //"<td style=' border-right:0px;' colspan='2' align='center'>"+img+"</td>"+
                                           // "<td colspan='2' align='center'>"+content+"</td>"+
                                       //  "</tr>"+
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
                                       $('.p_btn_class[onload]').trigger('onload');
                                       
                                       }
                           var count = data.count; // 3+3=6
                           console.log(count);
                           $(".divcount").remove();
                           $(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
                      }else if(data.chk=='false'){
                      					   if (confirm('마지막 글입니다. 처음으로 가시겠습니까?')) {
                           				 $('html').scrollTop(0);
                        				 }
                     				}
                   },
                  error:function(){
                     if (confirm('마지막 글입니다. 처음으로 가시겠습니까?')) {
                        $('html').scrollTop(0);
                     }
                  }
                  
               });
            }
           }
       });
      
      

   function cateclose() {
      $("#catlist").hide();
      $("#catbutton1").show();
      $("#close").hide();
      $("#listdiv").remove();
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
       //여기까지 추가 했음

       
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
</script>

<body>
   <!-- 카카오로 로그인 했을 경우 -->
   <jsp:include page="/WEB-INF/views/header/m_header.jsp" />

   <c:set var="postlist" value="${postlist }" />

   <c:if test="${mid!=null}">
      <div class="bodyall" align="center">
         <div class="left">
            <input type="button" class="category-btn" id="catbutton1"
               value="카테고리 등록하기"> <input type="button" id="close"
               value="접기" class="category-btn" onclick="cateclose()">
            <div id="catlist">
               <form action="catupdate" id="catform" method="post"
                  onsubmit="return catupdate()">
                  <input type="hidden" name="m_id" value="${mid }">
               </form>
            </div>
         </div>

         <div class="mainlist" align="center">
            
            <div style="background-color: #495164; margin-top: 2px; height: 60px;">
            <h3><font color="white">New Post</font></h3>
            </div>
           
            <c:if test="${searchlist!=null }">
               <div class="divcount">
                  <input type="hidden" id="hashcount" value="${hashsize }">
                  <!-- 값을 다른거로 보내줘야함 -->
               </div>
               
               <!-- @@@@@@@@@@@@@@@@@@@@@ -->
               <div id="friendPage" align="center">
         <c:forEach var="post" items="${searchlist }" varStatus="status">
          <table class="postForm" >
            <tr >
               <th colspan="1" class="title_td" >제목</th>
               <td colspan="3" style="table-layout:fixed; width: 75%;" align="center">${post.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
            <c:choose>
               <c:when test="${post.p_img != 'null'}">
                  <tr >
                        <td colspan="2" style=" border-right:0px;" align="center"><img src="img/${post.p_img }" width="150px" height="150px"></td>
                        <td colspan="2" align="center" style="width: 650px; height: 200px;">${post.p_content }</td>
                   </tr>
               </c:when>
               <c:otherwise>
                  <tr >
                     <td colspan="4" align="center" style="width: 650px; height: 200px;">${post.p_content }</td>
            </tr>
              </c:otherwise>
            </c:choose>
            <!-- =========================================== -->
            <tr >
               <th colspan="1" style="width: 50px;" class="title_td">카테고리</th>
               <td colspan="1"  align="center">${post.p_cat }</td>
               <th colspan="1" class="title_td" >해시</th>
               <td colspan="1" style="text-align: center">${post.p_hash }</td>
            </tr>
            <tr >
              <td colspan="2" class="btn_td" style="table-layout:fixed; width: 25%;">
				<button onload="p_like_btn(${post.p_idgroup })" id="btn${post.p_idgroup }" class="p_btn_class"  onclick="p_like(${post.p_idgroup })" >좋아요  <label id="lcount${post.p_idgroup }">${post.p_like }</label></button>
				</td>
               <th colspan="1" class="title_td" >작성자</th>
               <td colspan="1" align="center">${post.m_id } 
            </tr>
            <tr >
               <td colspan="4" align="center" class="re_td">
                <div class="replyBtn" OnClick="location.href='#replyShow${post.p_idgroup}'" id="${post.p_idgroup}" value="${mid}">댓글 ${post.p_rCount}개 모두 보기</div></td>
               </tr>
            </table>
            
               <div id="replyShow${post.p_idgroup}" class="replyShow1" height="500px">
               <div class="replyTag${post.p_idgroup}">
               <a href="#Close" title="Close" class="close" onclick="replyClose(${post.p_idgroup});">X</a>
               <table  id="replyTable" width="300px" height="500px">
               <tbody  id="replyList${post.p_idgroup}" class="ovr" ></tbody>
               </table>
               
               <div id="inputReply${post.p_idgroup}" style="height: 100px">
              
              
              
              
               <table border="1" id="replyInput" >
                  <tr>
                     <td><img src="img/${proImg}" id="profile"></td>
                     <td><b>${mid}</b><br>
                  <form id="replyForm${post.p_idgroup}"  method="post" class="r_form">
                     <textarea id="r_content${post.p_idgroup}" name="r_content" placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
                     <input type="hidden" name="r_idgroup" value="${post.p_num}">
                     <input type="hidden" name="r_pic" value="${proImg }">
                     <input class="addBtn" id="${post.p_idgroup}" type="button" value="게시" style="height: 50px; width: 80px;">
                  </form>
                     </td>
                     </tr>
               </table>
               </div>
            </div><br>
            </div>
           </c:forEach>
        </div>
                
         </c:if>
         
         
         <c:if test="${searchlist == null }">
         <div class="divcount">
            <input type="hidden" id="realcount" value="${pdtosize }">
        </div>
        
        
        <!-- ------------------------------------------------ -->
         <div id="friendPage" align="center">
         <c:forEach var="post" items="${pdto1 }" varStatus="status">
          <table class="postForm" >
            <tr >
               <th colspan="1" class="title_td" >제목</th>
               <td colspan="3" style="table-layout:fixed; width: 75%;" align="center">${post.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
            <c:choose>
            <c:when test="${post.p_img != 'null'}">
            <tr >
               <td colspan="2" style=" border-right:0px;" align="center"><img src="img/${post.p_img }" width="150px" height="150px"></td>
               <td colspan="2" align="center" style="width: 650px; height: 200px;">${post.p_content }</td>
            </tr>
            </c:when>
            <c:otherwise>
            <tr >
               <td colspan="4" align="center" style="width: 650px; height: 200px;">${post.p_content }</td>
            </tr>
            </c:otherwise>
            </c:choose>
            <!-- =========================================== -->
            <tr >
               <th colspan="1" style="width: 50px;" class="title_td">카테고리</th>
               <td colspan="1"  align="center">${post.p_cat }</td>
               <th colspan="1" class="title_td" >해시</th>
               <td colspan="1" style="text-align: center">${post.p_hash }</td>
            </tr>
            <tr >
               <td colspan="2" class="btn_td" style="table-layout:fixed; width: 25%;">
				<button onload="p_like_btn(${post.p_idgroup })" id="btn${post.p_idgroup }" class="p_btn_class"  onclick="p_like(${post.p_idgroup })" >좋아요  <label id="lcount${post.p_idgroup }">${post.p_like }</label></button>
				</td>
               <th colspan="1" class="title_td" >작성자</th>
               <td colspan="1" align="center">${post.m_id } 
            </tr>
            <tr >
               <td colspan="4" align="center" class="re_td">
               <div class="replyBtn" OnClick="location.href='#replyShow${post.p_idgroup}'" id="${post.p_idgroup}" value="${mid}">댓글 ${post.p_rCount}개 모두 보기</div></td>
               </tr>
            </table>
            
               <div id="replyShow${post.p_idgroup}" class="replyShow1" height="500px">
               <div class="replyTag${post.p_idgroup}">
               <a href="#Close" title="Close" class="close" onclick="replyClose(${post.p_idgroup});">X</a>
               <table  id="replyTable" width="300px" height="500px">
               <tbody  id="replyList${post.p_idgroup}" class="ovr" ></tbody>
               </table>
               
               <div id="inputReply${post.p_idgroup}" style="height: 100px">
              
              
              
              
               <table border="1" id="replyInput" >
                  <tr>
                     <td><img src="img/${proImg}" id="profile"></td>
                     <td><b>${mid}</b><br>
                  <form id="replyForm${post.p_idgroup}"  method="post" class="r_form">
                     <textarea id="r_content${post.p_idgroup}" name="r_content" placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
                     <input type="hidden" name="r_idgroup" value="${post.p_num}">
                     <input type="hidden" name="r_pic" value="${proImg }">
                     <input class="addBtn" id="${post.p_idgroup}" type="button" value="게시" style="height: 50px; width: 80px;">
                  </form>
                     </td>
                     </tr>
               </table>
               </div>
            </div><br>
            </div>
           </c:forEach>
        </div>

          </c:if>
     </div>
            
            
          <br><br>
        
        
        <div class="right">
        </div>
       </div>
   </c:if>
   
   
   <c:if test="${mid==null and nid!=null}">
      <script>
         location.href = "userpost";
      </script>
   </c:if>
   <c:if test="${mid==null and kid!=null }">
      <script>
         location.href = "kakaologout";
      </script>
   </c:if>
   <c:if test="${mid==null and kid==null and nid==null}">
      <script>
         alert("로그인 해주세요")
         location.href = "login";
      </script>
   </c:if>
   
</body>
</html>