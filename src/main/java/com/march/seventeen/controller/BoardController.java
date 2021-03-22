package com.march.seventeen.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.march.seventeen.command.board.BoardCommand;
import com.march.seventeen.command.board.BoardDeleteCommand;
import com.march.seventeen.command.board.BoardInsertCommand;
import com.march.seventeen.command.board.BoardListCommand;
import com.march.seventeen.command.board.BoardUpdateCommand;
import com.march.seventeen.command.board.BoardViewCommand;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	


	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String list(Model model) {
		boardCommand = new BoardListCommand();
		boardCommand.execute(sqlSession, model);
		return "board/boardList";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.GET)
	public String writePage() {
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardInsertCommand();
		boardCommand.execute(sqlSession, model);
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value="BoardView", method=RequestMethod.GET)
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		boardCommand = new BoardViewCommand();
		boardCommand.execute(sqlSession, model);
		return "board/boardView";
	}
	@RequestMapping(value="BoardUpdate", method=RequestMethod.POST)
	public String update(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardUpdateCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:boardList";
	}
	@RequestMapping(value="BoardDelete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardDeleteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:boardList";
	}
}