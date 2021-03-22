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

import com.march.seventeen.command.member.MemberEmailChkCommand;
import com.march.seventeen.command.member.MemberLoginCommand;
import com.march.seventeen.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberLoginCommand memberLoginCommand;
	private MemberEmailChkCommand memberEmailChkCommand;
	
	@Autowired
	public void setCommand(MemberLoginCommand memberLoginCommand,
						   MemberEmailChkCommand memberEmailChkCommand) {
		this.memberLoginCommand = memberLoginCommand;
		this.memberEmailChkCommand = memberEmailChkCommand;
	}
	
	@RequestMapping(value="loginPage.do", method=RequestMethod.GET)
	public String loginPage(HttpServletRequest request, Model model){
		return "member/loginPage";
	}
	@RequestMapping(value="joinPage", method=RequestMethod.GET)
	public String joinPage(HttpServletRequest request, Model model) {
		return "member/joinPage";
	}
	@RequestMapping(value="findPage", method=RequestMethod.GET)
	public String findPage(HttpServletRequest request, Model model) {
		return "member/findPage";
	}
	
	@RequestMapping(value="login", 
					method=RequestMethod.POST, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> login(@RequestBody MemberDto memberDto, 
							   HttpServletRequest request, Model model){
		if(memberDto != null) {
			model.addAttribute("memberDto", memberDto);
		}
		model.addAttribute("request", request);
		return memberLoginCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="emailChk", method=RequestMethod.POST,
			produces="text/plain; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailChk(@RequestBody String m_email,
									HttpServletRequest request, Model model){
		if(m_email != null) {
			model.addAttribute("m_email", m_email);
		}
		model.addAttribute("request", request);
		return memberEmailChkCommand.execute(sqlSession, model);
	}
}
