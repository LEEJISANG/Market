package com.march.seventeen.dao;

import com.march.seventeen.dto.MemberDto;

public interface MemberDao {
	public MemberDto login(String m_id, String m_pw);
}
