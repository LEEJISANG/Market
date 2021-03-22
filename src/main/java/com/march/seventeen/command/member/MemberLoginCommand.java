package com.march.seventeen.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.march.seventeen.dao.MemberDao;
import com.march.seventeen.dto.MemberDto;

public class MemberLoginCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		String m_id = memberDto.getM_id();  
		String m_pw = Sha256.sha256(memberDto.getM_pw());
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		if(memberDao.login(m_id, m_pw) != null) {
			resultMap.put("loginResult", 1);
			session.setAttribute("loginDto", memberDao.login(m_id, m_pw));
			System.out.println("로그인한 회원 DB: " + memberDao.login(m_id, m_pw));
		}else {
			resultMap.put("loginResult", 2);
		}
		
		return resultMap;
	}

}
