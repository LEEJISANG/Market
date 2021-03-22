package com.march.seventeen.command.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.march.seventeen.dao.MemberDao;

public class MemberEmailChkCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		String m_email = (String)map.get("m_email");
		System.out.println(m_email);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int emailChkResult = memberDao.emailChk(m_email);
		System.out.println(emailChkResult);
		if (emailChkResult == 1) {
			resultMap.put("emailChkResult", 1);
		}else {
			resultMap.put("emailChkResult", 2);
		}
		
		return null;
	}

}
