package com.care.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.care.modelDTO.CountForm;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.PostDTO;
import com.care.modelDTO.ReplyDTO;
import com.care.service.AddCommentService;
import com.care.service.DeleteCommentService;
import com.care.service.FListService;
import com.care.service.FPostListService;
import com.care.service.FriendPostService;
import com.care.service.GetCommentService;
import com.care.service.GetProImgService;
import com.care.service.IDchk;
import com.care.service.IService;
import com.care.service.IdSearch;
import com.care.service.MCategoryService;
import com.care.service.MInfoFixService;
import com.care.service.MLoginPostService;
import com.care.service.MLoginService;
import com.care.service.MMyInfoService;
import com.care.service.MRegisterService;
import com.care.service.MUserFindService;
import com.care.service.PBoardListService;
import com.care.service.PDeleteService;
import com.care.service.PLikeChkService;
import com.care.service.PLikeUpService;
import com.care.service.PWriteBoardService;
import com.care.service.PwChange;
import com.care.service.PwSearch;
import com.care.service.RLikeChkService;
import com.care.service.RLikeUpService;
import com.care.service.RReplyListService;
import com.care.service.RReplyWriteService;
import com.care.service.TotalSearch;
import com.care.service.UGetFriendRequestListService;
@Controller
public class MainController {

   IService ser;

   @Autowired
   ApplicationContext context = ApplicationContextprovider.applicationContext;

   //======== John 수정 / Post Profile pic (12/5) ========
   private static MemberDTO mypageMemberDTO = new MemberDTO();
   //===================================================
   
   @RequestMapping(value = "register")
   public String register(Model model, HttpServletRequest request) {
      return "register";
   }
   
   @RequestMapping(value = "register_chk")
   public String register_chk(Model model, MultipartHttpServletRequest request) {
      model.addAttribute("register", request);
      //model.addAttribute("multipartRequest", multipartRequest);
      ser = context.getBean("MRegisterService", MRegisterService.class);
      ser.execute(model); // du = ok
      ser = context.getBean("MCategoryService", MCategoryService.class);
      ser.execute(model); //
      return "registerchk";
   }
   @RequestMapping("loginchk") //<!-- 12-01추가한 것들 있음  -->
   public String loginchk(Model model, HttpServletRequest request,HttpServletResponse response) { // HttpServletResponse response 12-01추가
      model.addAttribute("request", request);
      model.addAttribute("response",response); // model.addAttribute("response",response); 12-01추가
      ser = context.getBean("MLoginService", MLoginService.class);
      ser.execute(model);
      Map<String, Object> map = model.asMap();
      String result = (String)map.get("login");
      if(result.equals("2")) {
         HttpSession session = request.getSession();
         session.setAttribute("mid", request.getParameter("id"));
      }
      return "loginchk";
   }
   
   
   @RequestMapping("main")
   public String main(Model model,HttpServletRequest request,HttpSession session) {
      if(session.getAttribute("mid")==null) {
         return "main";
      }
      model.addAttribute("session",session);
      ser = context.getBean("MLoginPostService",MLoginPostService.class);
      ser.execute(model);
      model.addAttribute("friendLists", session);
      ser = context.getBean("getProImgService", GetProImgService.class);
       ser.execute(model);
      Map<String,Object> map = model.asMap();
      int size = (Integer)map.get("endcount");
      ArrayList<PostDTO> pdto = (ArrayList<PostDTO>) map.get("postlist");
      ArrayList<PostDTO> pdto1 = new ArrayList<PostDTO>();
      
      if(size>=3) {
         pdto1.add(pdto.get(0));
         pdto1.add(pdto.get(1));
         pdto1.add(pdto.get(2));
      
      }else if(size==2) {
         pdto1.add(pdto.get(0));
         pdto1.add(pdto.get(1));
      }else if(size==1) {
         pdto1.add(pdto.get(0));
      }
      model.addAttribute("pdto1",pdto1);
      model.addAttribute("pdtosize",pdto1.size());
      return "main";
   }
   
   @ResponseBody
      @RequestMapping(value = "mainajax")
      public Map<String, Object> mainajax(Model model,CountForm countform,HttpSession session){
         int postcount = countform.getCountform();
         model.addAttribute("session",session);
         ser = context.getBean("MLoginPostService",MLoginPostService.class);
         ser.execute(model); // 
         model.addAttribute("friendLists", session);
         ser = context.getBean("getProImgService", GetProImgService.class);
          ser.execute(model);
         Map<String, Object> map = model.asMap();
         ArrayList<PostDTO> list = (ArrayList<PostDTO>)map.get("postlist");
         ArrayList<PostDTO> list2 = new ArrayList<PostDTO>();           
         Map<String, Object> mainaja = new HashMap<String, Object>();
         
          if(list.size()-postcount==0) { 
            mainaja.put("chk","false"); 
         
          }else if (list.size()-postcount==1) { //7-6=1
               list2.add(list.get(postcount)); //7번째 게시글 6번인덱스
            mainaja.put("count",postcount+1); // 7리턴
            mainaja.put("chk", "true");
            mainaja.put("list2",list2);
            mainaja.put("cnt", 1);
         }else if(list.size()-postcount==2) {//2개가져옴
            for (int i = postcount; i < postcount+2; i++) { 
               list2.add(list.get(i));
            }
            mainaja.put("count",postcount+2);
            mainaja.put("chk", "true");
            mainaja.put("list2",list2);
            mainaja.put("cnt", 2);
         }else { 
            for (int i = postcount; i < postcount+3; i++) {  // 3번인덱스부터 5번까지 3 ,4,5 총 6개게시글
               list2.add(list.get(i));
            }
            mainaja.put("count",postcount+3);//6리턴
            mainaja.put("list2",list2);
            mainaja.put("chk", "true");
            mainaja.put("cnt", 3);
         }
         return mainaja;
      }
      
   @ResponseBody
   @RequestMapping(value = "hashajax")
   public Map<String, Object> hashajax(Model model,HttpServletRequest request, HttpSession session){
     int hashcount = Integer.parseInt(request.getParameter("hashcount"));
     model.addAttribute("request",request);
     ser = context.getBean("totalSearch",TotalSearch.class);
      ser.execute(model); // 
      model.addAttribute("friendLists", session);
      ser = context.getBean("getProImgService", GetProImgService.class);
       ser.execute(model);
      Map<String, Object> map = model.asMap();
      ArrayList<PostDTO> list = (ArrayList<PostDTO>)map.get("ajaxlist");
      ArrayList<PostDTO> list2 = new ArrayList<PostDTO>();           
      Map<String, Object> mainaja = new HashMap<String, Object>();
      
      if(list.size()-hashcount==0) { 
          mainaja.put("chk","false"); 
       
        }else if (list.size()-hashcount==1) { //7-6=1
             list2.add(list.get(hashcount)); //7번째 게시글 6번인덱스
          mainaja.put("count",hashcount+1); // 7리턴
          mainaja.put("chk", "true");
          mainaja.put("list2",list2);
          mainaja.put("cnt", 1);
       }else if(list.size()-hashcount==2) {//2개가져옴
          for (int i = hashcount; i < hashcount+2; i++) { 
             list2.add(list.get(i));
          }
          mainaja.put("count",hashcount+2);
          mainaja.put("chk", "true");
          mainaja.put("list2",list2);
          mainaja.put("cnt", 2);
       }else { 
          for (int i = hashcount; i < hashcount+3; i++) {  // 3번인덱스부터 5번까지 3 ,4,5 총 6개게시글
             list2.add(list.get(i));
          }
          mainaja.put("count",hashcount+3);//6리턴
          mainaja.put("list2",list2);
          mainaja.put("chk", "true");
          mainaja.put("cnt", 3);
       }
      
      return mainaja;
   }
   
   //---------------- 아이디 찾기 비번찾기 
   @RequestMapping("idfind")
   public String idfind(Model model, MemberDTO mdto) {
      System.out.println(mdto.getM_name());
      model.addAttribute("mdto",mdto);
      ser = context.getBean("idSearch", IdSearch.class);
      ser.execute(model);
      return "idpwfindpage";
   }
   @RequestMapping("pwfind")
   public String pwfind(Model model, MemberDTO mdto) {
      model.addAttribute("mdto",mdto);
      ser = context.getBean("pwSearch",PwSearch.class);
      ser.execute(model);
      return "idpwfindpage";
   }
   @RequestMapping("pwchange")
   public String pwchange(Model model, MemberDTO mdto) {
     System.out.println(mdto.getM_id() + ": pwchange");
     model.addAttribute("mdto",mdto);
     ser = context.getBean("pwChange",PwChange.class);
     ser.execute(model);
      return "login";
   }
   
   @RequestMapping("totalsearch")
   public String totalsearch(Model model, HttpServletRequest request , HttpSession session) {
      model.addAttribute("request",request);
      ser = context.getBean("totalSearch",TotalSearch.class);
      ser.execute(model);
      model.addAttribute("friendLists", session);
      ser = context.getBean("getProImgService", GetProImgService.class);
       ser.execute(model);
      return "main"; // 각각의 페이지로 바꿔주면 되는 거고, 메인페이지에서 c:if문으로 조건을 달아줘야 함.
   }
   
   @ResponseBody
   @RequestMapping(value = "idchk",produces="application/json; charset=utf8")
   public Map<String, Object> idchk(Model model,HttpServletRequest request) {
      String result = "";
      model.addAttribute("request",request);
      ser = context.getBean("IDchk",IDchk.class);
      ser.execute(model);
      Map<String, Object> idchkmap = new HashMap<String, Object>();
      Map<String, Object> map = model.asMap();
      result = (String) map.get("idresult");
      if (result.equals("ok")) { //회원가입가능
         idchkmap.put("result", result);
      }else {
         idchkmap.put("result", result);
      }
      return idchkmap;
   }
   
   ////////////////////////////////////////////////
   //친구 게시글만 보는 페이지 
      
   
         


   ////////////////////////////////////////////////
   
   //친구 게시글만 보는 페이지 
   ArrayList<PostDTO> flist = new ArrayList<PostDTO>();
   ArrayList<ReplyDTO> rlist = new ArrayList<ReplyDTO>();
   @RequestMapping("f_page")
   public String f_page(Model model, HttpSession session) {
      model.addAttribute("friendLists", session);
      String id = (String)session.getAttribute("mid");
      System.out.println("@@@@@@@@@@@");
      System.out.println(id);
      System.out.println("@@@@@@@@@@@@");
      ser = context.getBean("FListService", FListService.class);
      ser.execute(model);
      ser = context.getBean("friendPostService", FriendPostService.class);
      ser.execute(model);
      ser = context.getBean("getProImgService", GetProImgService.class);
       ser.execute(model);
      //Map<String, Object> map = model.asMap();
      //flist = (ArrayList<PostDTO>) map.get("fPost");   
      return "f_page";
   }

   //친구 게시글 ajax 출력
   @ResponseBody
   @RequestMapping(value="fpostList")
   public List<PostDTO> fpostList(Model model, PostDTO pdto, HttpServletRequest request, HttpSession session) {
      HashMap<String, Object> fpageParameter = new HashMap<String, Object>();
      String mid = (String)session.getAttribute("mid");
      System.out.println("===========");
      System.out.println(mid);
      System.out.println("===========");
      fpageParameter.put("sid", mid );
      fpageParameter.put("page_no", request.getParameter("page_no"));
      model.addAttribute("friendLists", fpageParameter);
      ser = context.getBean("FPostListService", FPostListService.class);
      ser.execute(model);
      Map<String, Object> map = model.asMap();
      flist = (ArrayList<PostDTO>) map.get("fPost"); 
      return flist;
   }

   //============================양진영=============================
   //============================내 페이지===========================
   ArrayList<PostDTO> list = new ArrayList<PostDTO>();
   ArrayList<ReplyDTO> replylist = new ArrayList<ReplyDTO>();
   @RequestMapping(value = "mypage")
   public String mypage(Model model,HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
      String sessionid = (String)session.getAttribute("mid");
      model.addAttribute("sessionid",sessionid);
      //======== John 수정 / Post Profile pic (12/5) ========
      ser = context.getBean("MMyInfoService", MMyInfoService.class);
      ser.execute(model);   
      Map<String, Object> map = model.asMap();
      MemberDTO dto = (MemberDTO)map.get("myinfo");
      System.out.println("dto:" + dto);
      System.out.println("dto m_pic:" + dto.getM_pic());
      mypageMemberDTO.setM_pic(dto.getM_pic());
      //================================================
      ser = context.getBean("PBoardListService", PBoardListService.class);
      ser.execute(model);
      Map<String, Object> map2 = model.asMap();
      list = (ArrayList<PostDTO>) map2.get("boardlist");
      model.addAttribute("request", request);
      ser = context.getBean("UGetFriendRequestListService", UGetFriendRequestListService.class);
      ser.execute(model);
      model.addAttribute("friendLists", session);
      ser = context.getBean("getProImgService", GetProImgService.class);
       ser.execute(model);

      return "mypage";
   }
   //===========================회원정보 수정 후 리다이렉트================
   @RequestMapping(value = "fix_myinfo" , method = RequestMethod.POST)
   public String fix_myinfo(Model model, HttpServletRequest request){
      model.addAttribute("info_fix",request);
      ser = context.getBean("MInfoFixService", MInfoFixService.class);
      ser.execute(model);
      return "redirect:mypage";
   }
   //===========================내정보 리스트 받기===========================
   @ResponseBody
   @RequestMapping(value = "my_info")
   public Map<String, Object> my_info(Model model, HttpSession session) {
      String sessionid = (String)session.getAttribute("mid");
      model.addAttribute("sessionid",sessionid);
      ser = context.getBean("MMyInfoService", MMyInfoService.class);
      ser.execute(model);   
      //========================
      Map<String, Object> map = model.asMap();
      MemberDTO dto = (MemberDTO)map.get("myinfo");
      //=====================
      Map<String, Object> my_info = new HashMap<String, Object>();
      my_info.put("memdto", dto);
      return my_info;
   }
   //===========================유저 찾기===========================
   @ResponseBody
   @RequestMapping(value = "user_find")
   public Map<String, Object> user_find(Model model, MemberDTO mdto) {
      String user_friend = mdto.getM_id();
      model.addAttribute("user_id", user_friend);

      Map<String, Object> map = model.asMap();
      ser = context.getBean("MUserFindService", MUserFindService.class);
      ser.execute(model);   
      MemberDTO dto = (MemberDTO)map.get("userinfo");
      Map<String, Object> user_info = new HashMap<String, Object>();

      if(dto==null) {
         user_info.put("chk", 0);
      }else if( dto!=null) {
         user_info.put("chk", 1);
         user_info.put("dto", dto);
      }
      return user_info;
   }
   
   //===========================개시글 작성===========================
   @RequestMapping(value = "write_board", method = RequestMethod.POST)
   public RedirectView write_board(Model model, PostDTO pdto, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) throws IOException {
      model.addAttribute("request", request);
      String m_id = (String)session.getAttribute("mid");

      //======== John 수정 / Post Profile pic (12/5) ========
      pdto.setM_id(m_id);
      pdto.setM_pic(mypageMemberDTO.getM_pic());
      //===================================================
      model.addAttribute("write_board", pdto);
      ser = context.getBean("PWriteBoardService", PWriteBoardService.class);
      ser.execute(model);
      Map<String, Object> map = model.asMap();
      boolean result = (boolean) map.get("writeSuccess");
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      RedirectView redirectView = new RedirectView("mypage", true);
      if (result) {
         redir.addFlashAttribute("postSuccess", "1");
         model.addAttribute("postSuccess", "1");
         System.out.println("result:" + result);
      } else {
         redir.addFlashAttribute("postSuccess", "0");
         model.addAttribute("postSuccess", "0");
         System.out.println("result:" + result);
      }
      return redirectView;
   }
   //===========================개시글 리스트===========================
   private int cnt=3;
   @ResponseBody
   @RequestMapping(value = "boardlist")
   public Map<String, Object> boardlist(Model model, PostDTO podto) {
      Map<String, Object> boardlist_map = new HashMap<String, Object>();

      int i = cnt;

      if(i<list.size()) {
         boardlist_map.put("chk", "true");
         boardlist_map.put("morePosts", true);
         boardlist_map.put("post", list.get(i));
         ++cnt;
         return boardlist_map;
      }else if(list.size()==0){
         boardlist_map.put("chk", "non");
         return boardlist_map;
      }else{
         boardlist_map.put("chk", "false");
         boardlist_map.put("morePosts", false);
         return boardlist_map;
      }
   }
   //===========================댓글 리스트===========================
    @ResponseBody
    @RequestMapping(value = "replylist")
    public Map<String, Object> replylist(Model model, PostDTO pdto) {
       model.addAttribute("idgroup", pdto.getP_idgroup());
       ser = context.getBean("RReplyListService", RReplyListService.class);
       ser.execute(model);
       Map<String, Object> map = model.asMap();
       replylist = (ArrayList<ReplyDTO>) map.get("replylist");
       Map<String, Object> replylist_map = new HashMap<String, Object>();
       replylist_map.put("replylist_1", replylist);
       return replylist_map;
    }
    //===========================댓글 작성===========================
    @ResponseBody
    @RequestMapping(value = "reply_write")
    public void reply_write(Model model, ReplyDTO rdto) {
       model.addAttribute("reply_write", rdto);
       ser = context.getBean("RReplyWriteService", RReplyWriteService.class);
       ser.execute(model);
    }
    //===========================좋아요 값 올리기===========================
    //===========================좋아요 값 올리기===========================
    @ResponseBody
    @RequestMapping(value = "like_up")
    public Map<String, Object> like_up(Model model, PostDTO pdto) {
       model.addAttribute("like_up", pdto);
       ser = context.getBean("PLikeUpService", PLikeUpService.class);
       ser.execute(model);
       int cnt = pdto.getP_like();
       Map<String, Object> map = model.asMap();
       int chk = (Integer)map.get("chk"); 
       int lcount =(int)map.get("lcount");
       Map<String, Object> chk_map = new HashMap<String, Object>();
       chk_map.put("chk", chk);
       chk_map.put("lcount", lcount);
     
       return chk_map;
    }
  //============버튼 태스트
      @ResponseBody
      @RequestMapping(value = "p_like_btn")
      public Map<String, Object> p_like_btn(Model model, PostDTO pldto) {
         model.addAttribute("like_chk", pldto);
         ser = context.getBean("PLikeChkService", PLikeChkService.class);
         ser.execute(model);
         Map<String, Object> map = model.asMap();
         Map<String, Object> chk_map = new HashMap<String, Object>();
         int chk = (Integer)map.get("btnchk");
         if(chk==1) {
            int idgroup = (Integer)map.get("idgroup");
            chk_map.put("chk", chk);
            chk_map.put("idgroup", idgroup);
         }else {
            chk_map.put("chk", chk);
         }
         return chk_map;
   }
   //리플 좋아요 버튼 테스트=====================
       @ResponseBody
        @RequestMapping(value = "r_like_up")
        public Map<String, Object> r_like_up(Model model, ReplyDTO rdto) {
           model.addAttribute("r_like_up", rdto);
           ser = context.getBean("RLikeUpService", RLikeUpService.class);
           ser.execute(model);
           Map<String, Object> map = model.asMap();
           int chk = (Integer)map.get("chk");
           Map<String, Object> chk_map = new HashMap<String, Object>();
           chk_map.put("chk", chk);
           return chk_map;
        }
      //============버튼 태스트
         @ResponseBody
         @RequestMapping(value = "r_like_btn")
         public Map<String, Object> r_like_btn(Model model, ReplyDTO rdto) {
            model.addAttribute("r_like_chk", rdto);
            ser = context.getBean("RLikeChkService", RLikeChkService.class);
            ser.execute(model);
            Map<String, Object> map = model.asMap();
            Map<String, Object> chk_map = new HashMap<String, Object>();
            int chk = (Integer)map.get("btnchk");
            if(chk==1) {
               int r_num = (Integer)map.get("r_num");
               chk_map.put("chk", chk);
               chk_map.put("r_num", r_num);
            }else {
               chk_map.put("chk", chk);
            }
            return chk_map;
         }
         //============글 지우기
         @ResponseBody
         @RequestMapping(value = "del_post")
         public void del_post(Model model, PostDTO pdto) {
            model.addAttribute("pdto", pdto);
            ser = context.getBean("PDeleteService", PDeleteService.class);
            ser.execute(model);
         }
   ////////////////////////////////////////////////////////////////

   
         
      ////////////////////////////////////////////////////////////////
         
       //댓글 추가
         @ResponseBody
         @RequestMapping(value="addComment",produces="application/json; charset=utf8")
         public void addComment(Model model, HttpSession session, ReplyDTO redto) {
            model.addAttribute("replyId", session);
            model.addAttribute("reply_dto", redto);
            ser = context.getBean("addCommentService", AddCommentService.class);
            ser.execute(model);
         }
               
         // 댓글 가져오기 
         @ResponseBody
         @RequestMapping(value="getComment", produces="application/json; charset=utf8")
         public List<ReplyDTO> getComment(Model model, HttpServletRequest request, ReplyDTO redto) {
            HashMap<String, Object> replyParameter = new HashMap<String, Object>();
            replyParameter.put("re_no", request.getParameter("re_no"));
            replyParameter.put("p_num", redto.getR_idgroup());
         //   System.out.println("파라미터 받앗나? : " + replyParameter.get("re_no"));
         //   System.out.println("p_num 받앗나? : " + replyParameter.get("p_num"));
            model.addAttribute("replyList", replyParameter);
            ser = context.getBean("getCommentService", GetCommentService.class);
            ser.execute(model);
            Map<String, Object> map = model.asMap();
            rlist = (ArrayList<ReplyDTO>) map.get("rList");
            return rlist;
         }
               
         //댓글 삭제하기
         @ResponseBody
         @RequestMapping(value="replyDelete", produces="application/json; charset=utf8")
         public void replyDelete(Model model, ReplyDTO redto) {
            model.addAttribute("r_num", redto);
            ser = context.getBean("deleteCommentService", DeleteCommentService.class);
            ser.execute(model);
         }
         
}



















