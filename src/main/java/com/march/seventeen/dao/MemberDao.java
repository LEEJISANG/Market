package com.march.seventeen.dao;

import com.march.seventeen.dto.MemberDto;

public interface MemberDao {
	public MemberDto login(String m_email, String m_pw);
	public int emailChk(String m_email);
}

