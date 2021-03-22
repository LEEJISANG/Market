package com.march.seventeen.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDto {
	int m_no;
	String m_email;
	String m_pw;
	String m_name;
	String m_nickName;
	String m_addr1;
	String m_addr2;
	String m_addr3;
	String m_phone1;
	String m_phone2;
	String m_phone3;
	String m_grade;
	String m_account1;
	String m_account2;
	Date m_regDate;
}
