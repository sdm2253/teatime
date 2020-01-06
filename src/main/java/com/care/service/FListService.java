package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
@Service
public class FListService implements IService{

	@Autowired
	ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession request = (HttpSession)map.get("friendLists");
		String myId = (String)request.getAttribute("mid");
		System.out.println("세션 : " + myId);
	//	System.out.println("아이디 : " + my_id);
	//	System.out.println(mdao.friendId(my_id));
		model.addAttribute("flist", mdao.friendLists(myId));
	}

}
