package com.march.seventeen.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
//	@Autowired
//	private MemberCommand memberCommand;
	
//	@Autowired
//	public void setCommand(MemberCommand memberCommand) {
//		this.memberCommand = memberCommand;
//	}
	
//	@RequestMapping(value="signin")
	
	
	
}
