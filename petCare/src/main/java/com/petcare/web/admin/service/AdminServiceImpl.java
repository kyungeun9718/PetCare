package com.petcare.web.admin.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.petcare.web.admin.dao.AdminDAO;
import com.petcare.web.admin.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDAO;

	@Override
	public boolean loginCheck(AdminVO vo, HttpSession session) {
		boolean result = adminDAO.loginCheck(vo);
		if (result) {
			AdminVO vo2 = getAdmin(vo);
			session.setAttribute("ad_id", vo2.getAd_id());
			session.setAttribute("ad_pw", vo2.getAd_pw());
		}
		return result;
	}

	@Override
	public AdminVO getAdmin(AdminVO vo) {
		return adminDAO.getAdmin(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}