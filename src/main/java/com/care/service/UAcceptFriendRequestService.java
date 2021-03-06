package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class UAcceptFriendRequestService implements IService {

	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int result = 0;
		String f_id = request.getParameter("m_id");
		
		String m_id = (String)session.getAttribute("mid");
		
		MyFriendDTO mfdto = new MyFriendDTO();
		
		mfdto.setM_id(m_id);
		mfdto.setF_id(f_id);
		mfdto.setF_isfriend(2);
		result = dao.acceptFriendRequest(mfdto);
		if (result == 1) {
			model.addAttribute("addFriendSuccess", "1");
		} else {
			model.addAttribute("addFriendSuccess", "0");
		}
		
	}

}
