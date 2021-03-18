package com.march.seventeen.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.march.seventeen.command.member.MemberLoginCommand;
import com.march.seventeen.dto.MemberDto;

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
	
	@RequestMapping(value="loginPage.do", method=RequestMethod.GET)
	public String loginPage(HttpServletRequest request, Model model){
		return "member/loginPage";
	}
	
	@RequestMapping(value="login.do", 
					method=RequestMethod.POST, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> login(@RequestBody MemberDto memberDto, HttpServletRequest request, Model model){
		if(memberDto != null) {
			model.addAttribute("memberDto", memberDto);
		}
		model.addAttribute("request", request);
		return memberLoginCommand.execute(sqlSession, model);
	}
	
	
}
