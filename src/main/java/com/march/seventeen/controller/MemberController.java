package com.march.seventeen.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.march.seventeen.command.member.MemberLoginCommand;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberLoginCommand memberLoginCommand;
	
	@Autowired
	public void setCommand(MemberLoginCommand memberLoginCommand) {
		this.memberLoginCommand = memberLoginCommand;
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest request, Model model){
		return "member/loginPage";
	}
	
	
}
